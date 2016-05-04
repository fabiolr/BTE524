//
//  ViewController.swift
//  coredata
//
//  Created by Fabio Ribeiro on 3/24/16.
//  Copyright © 2016 Fabio Ribeiro. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let mycontext:NSManagedObjectContext = appDel.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users",inManagedObjectContext: mycontext)
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

