//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var name = "tarek"
print("hello " + name + ".")
print("hello \(name).")


var x:Int = 9
x = x*2
print (x)
x = x/4


var y = 7
print (x+y)
var num:Double = 8.9
print(num)

print(num * Double(x))

var isAlpha:Bool = true
var a:Double = 6.75
var b:Int = 8

print ("the prodict of \(a) and \(b) is \(a*Double(b))")

var array = [2, 8, 4, 17, 47, 13]
print(array[2])
print(array.count)
array.append(59)
array.removeAtIndex(5)
print(array)
array.sort()
array.append(array[0] * array[1])

var dictionary = ["raspberrypi":"a very small but powerfull pc","coffee":"a very powerfull drink","diet coke":"an unhealthy drink"]

print (dictionary["raspberrypi"]!)

print(dictionary)

var menu = ["burger":4.99,"fries":2.99,"salad":5.99]
var myTicket = menu["burger"]! + menu ["salad"]!



arc4random_uniform(6)






