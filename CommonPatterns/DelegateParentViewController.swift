//
//  DelegateParentViewController.swift
//  CommonPatterns
//
//  Created by Craig Stanford on 11/06/2014.
//  Copyright (c) 2014 Monsterbomb. All rights reserved.
//

import UIKit

class DelegateParentViewController: UIViewController, DelegateExampleDelegate {

    @IBOutlet var textLabel : UILabel
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if let segue = segue {
            if segue.identifier == "DelegateSegue" {
             let controller = segue.destinationViewController as DelegateExampleViewController
                controller.delegate = self
            }
        }
    }
    
    func delegateExampleController(controller: DelegateExampleViewController, changedText: String)  {
        textLabel.text = changedText
    }
    
}
