//
//  ViewController.swift
//  test_db
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
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("John", forKey: "username")
        newUser.setValue("123", forKey: "password")
        
        do {
            
            try context.save()
        } catch {
            print("problem")
        }
        
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        do {
            
            let results = try context.executeFetchRequest(request)
            if(results.count>0) {
                
                for result in results as![NSManagedObject] {
                    
                    print (result.valueForKey("username"))
                    print (result.valueForKey("password"))
                }
            }
            
        } catch {
            print("problem 2")
            
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

