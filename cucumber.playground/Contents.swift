//: Playground - noun: a place where people can play

import UIKit

let vegetable = "bell pepper"

switch vegetable {
    
case "celery":
    
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    
    print("That would make a good tea sandwich.")
    
case let x where x.hasSuffix("pepper"):
    
    print("Is it a spicy \(x)?")
    
default:
    
    print("Everything tastes good in soup.")

}


func sayHello(personName: String) -> String {
    
    let greeting = "Hello, \(personName)."
    
    return greeting
    
}

sayHello("Fabio")
