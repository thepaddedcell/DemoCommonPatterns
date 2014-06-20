//
//  NotificationViewController.swift
//  CommonPatterns
//
//  Created by Craig Stanford on 11/06/2014.
//  Copyright (c) 2014 Monsterbomb. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBAction func buttonTapped(sender : AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("MyNotification", object: nil)
    }
}
