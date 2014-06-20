//
//  DelegateExampleViewController.swift
//  CommonPatterns
//
//  Created by Craig Stanford on 11/06/2014.
//  Copyright (c) 2014 Monsterbomb. All rights reserved.
//

import UIKit

protocol DelegateExampleDelegate {
    func delegateExampleController(controller:DelegateExampleViewController, changedText:String)
}

class DelegateExampleViewController: UIViewController, UITextFieldDelegate {

    var delegate: DelegateExampleDelegate?
    
    @IBOutlet var textField : UITextField
    
    func textFieldDidEndEditing(textField: UITextField!) {
        if let delegate = delegate {
            if textField.text {
                delegate.delegateExampleController(self, changedText: textField.text)
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
