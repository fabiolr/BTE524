//: Playground - noun: a place where people can play

import UIKit
import Foundation


for var i=2; i<=20; i=i+2 {
    
    print(i)
    
}

var arr = [8,3,9,11]

for x in arr {
    
    print(x)
    
}



for (index, value) in arr.enumerate(){
    
    arr[index] = value + 1}

var myarray = [8.0,7.0,19.0,28.0]



for(index,value) in myarray.enumerate() {
    
    myarray[index] = value/2
    
    print("Item \(index): \(myarray[index])")
    
}

print(myarray)


var list = ["a":1,"b":2,"c":3,"d":5]

for(index, (letter, value)) in list.enumerate() {
    
    print("Item \(index) : \(letter) \(value)")
}



var ourarray = [8,3,6,8,2,45,21]


var i = 0
while i < ourarray.count {
    
    ourarray[i] = ourarray[i] + 1
    print(ourarray[i])
    i++
}









