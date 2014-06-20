//
//  KVOExampleViewController.swift
//  CommonPatterns
//
//  Created by Craig Stanford on 11/06/2014.
//  Copyright (c) 2014 Monsterbomb. All rights reserved.
//

import UIKit

class KVOExampleViewController: UIViewController {

    @IBOutlet var textLabel : UILabel
    @IBOutlet var slider : UISlider
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addObserver(self, forKeyPath: "slider.value", options: NSKeyValueObservingOptions.Initial, context: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver(self, forKeyPath: "slider.value")
    }
    
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: NSDictionary!, context: CMutableVoidPointer) {
        if keyPath == "slider.value" {
            textLabel.text = "Value :\(slider.value)"
        }
    }
    
}
