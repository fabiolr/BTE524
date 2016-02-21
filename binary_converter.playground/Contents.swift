//: A Binary-Decimal Converter

import Darwin  // needed for pow()


var decimalInput: Int = 1  // Try your own

var remainer: Int
var position: Int = 1
var binaryOut = 0


while (decimalInput != 0) {
            remainer = decimalInput % 2
            decimalInput /= 2
            binaryOut += remainer * position
            position *= 10
}

///////////////////////////////////////////////////////////////////
binaryOut   // Binary output of Decimal -> Binary Conversion  ///// ------------>
///////////////////////////////////////////////////////////////////

//: A Decimal-Binary Converter


var binaryInput: Int = binaryOut  // using output of previous conversion, to check both 
// var binaryInput: Int = 1010  // Or use any other binary number here


var decimalOutput: Int = 0
var counter: Int = 0
var remainer2: Int

while (binaryInput != 0)    {
    
            remainer2 = binaryInput % 10
            binaryInput /= 10
            decimalOutput += (remainer2 * (Int((pow(Double(2),Double(counter))))))
            ++counter
}


////////////////////////////////////////////////////////////////////////
decimalOutput   // Decimal output of Binary -> Decimal Conversion  ///// ------------>
////////////////////////////////////////////////////////////////////////


