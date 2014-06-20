//
//  KVCViewController.swift
//  CommonPatterns
//
//  Created by Craig Stanford on 11/06/2014.
//  Copyright (c) 2014 Monsterbomb. All rights reserved.
//

import UIKit

enum AnimalType:String {
    case Mammal = "Mammal"
    case Reptile = "Reptile"
    case Bird = "Bird"
    func simpleDescription() -> String {
        switch self {
        default:
            return String(self.toRaw())
        }
    }
    
}

class Animal: NSObject {
    let name:String
    let type:AnimalType
    
    init(newName:String, newType:AnimalType) {
        name = newName
        type = newType
        super.init()
    }
}

class KVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView
    
    var allData = NSArray.array()
    var dataSource = NSArray.array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allData = [
            Animal(newName: "Cow", newType: AnimalType.Mammal),
            Animal(newName: "Seagull", newType: AnimalType.Bird),
            Animal(newName: "Dog", newType: AnimalType.Mammal),
            Animal(newName: "Cat", newType: AnimalType.Mammal),
            Animal(newName: "Hawk", newType: AnimalType.Bird),
            Animal(newName: "Snake", newType: AnimalType.Reptile),
            Animal(newName: "Crocodile", newType: AnimalType.Reptile),
            Animal(newName: "Turtle", newType: AnimalType.Reptile),
            Animal(newName: "Koala", newType: AnimalType.Mammal),
            Animal(newName: "Echidna", newType: AnimalType.Mammal),
        ]
        self.dataSource = allData
    }
    
    @IBAction func segmentChanged(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            let predicate = NSPredicate(format: "self.type == \"\(AnimalType.Mammal.simpleDescription())\"", nil)
            self.dataSource = self.allData.filteredArrayUsingPredicate(predicate)
        case 1:
            self.dataSource = self.allData
        case 2:
            let predicate = NSPredicate(format: "self.type == \"\(AnimalType.Reptile.simpleDescription())\"", nil)
            self.dataSource = self.allData.filteredArrayUsingPredicate(predicate)
        default:
            println("BARF")
        }
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        let animal = dataSource[indexPath.row] as Animal
        cell.text = animal.name
        return cell
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}
