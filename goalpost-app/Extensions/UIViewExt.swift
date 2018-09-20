//
//  UIViewExt.swift
//  goalpost-app
//
//  Created by Eslam on 9/9/18.
//  Copyright © 2018 EslamAtef. All rights reserved.
//

import UIKit

extension UIView{
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyBoardWillChange(_ notifiction: NSNotification) {
        let duration = notifiction.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notifiction.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFram = (notifiction.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFram = (notifiction.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFram.origin.y - startingFram.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
