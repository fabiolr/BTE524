//: Playground - noun: a place where people can play

var number = 39

var isItPrime = true

if number == 1 {
    isItPrime = false
    }

if number != 1 && number != 2 {
    
    for var i = 2; i < number ; i++ {
        if number % i == 0 {
            isItPrime = false
        }
    }
}

print (isItPrime)

