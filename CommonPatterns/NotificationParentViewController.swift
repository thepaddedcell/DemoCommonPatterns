//
//  NotificationParentViewController.swift
//  CommonPatterns
//
//  Created by Craig Stanford on 11/06/2014.
//  Copyright (c) 2014 Monsterbomb. All rights reserved.
//

import UIKit

class NotificationParentViewController: UIViewController {

    var index = 0
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "myNotificationHappened:", name: "MyNotification", object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    @objc func myNotificationHappened(notification:NSNotification) {
        index = index + 1
        if index > 2 {
            index = 0
        }
        switch index {
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.orangeColor()
        case 2:
            self.view.backgroundColor = UIColor.magentaColor()
        default:
            println("Outside of bounds")
        }
    }
    
}
