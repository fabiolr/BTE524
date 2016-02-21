// Caesar Cipher Decrypter
// Code by @fabiolr
// written freely, not optimised for performance
// todo: can reduce # of iterations


var encryptedMessage = "xultpaajcxitltlxaarpjhtiwtgxktghidhipxciwtvgtpilpitghlxiwiwtxgqadds"
var ascCodes: [Int] = Array<Int>()  // to collect ASCII codes from encrypted messgae

var letterAscCodes: [Int] = Array<Int>()  // to collect ASCII codes from common letters

var commonLetters = "etioansr"

var decodedMessages: [String:String] = [:]  // dictonary to keep decrypted messages


for letter in commonLetters.utf8 {
    letterAscCodes.append(Int(String(letter))!)  // add ascii codes to array
}


for character in encryptedMessage.utf8 {
    ascCodes.append(Int(String(character))!)  // add ascii codes to array
}


var counts:[Int:Int] = [:]
for item in ascCodes {
    counts[item] = (counts[item] ?? 0) + 1 // counting occurance of each ascii code, starting with 0, and putting results in dictionary
}

var largest = 0
for (asc, freq) in counts {
        if freq > largest {
            largest = freq  // figure out wich is the largest count (most frequent)
        }
    }

for letterCode in letterAscCodes {  // will decode message for each common letter

    var mostfreq = 0
    var offset = 0

    for (asc, freq) in counts {
        if freq == largest {
            mostfreq = asc  // iterate dict of ascii codes and frequencies to find the code that had the highest frequency
            
        }
    }

        if mostfreq > letterCode {  // check to see if offset is positive or negative
            
            // whenever most frequent letter is higher than common letter
            offset = mostfreq - letterCode
            
        } else {
            
            // whenever most frequent letter is lower than common
            let offset = letterCode - mostfreq
            
    }

    var decAscCodes: [Int] = Array<Int>()  // array to keep decrypted ascii codes

    for ascCode in ascCodes {
        
        
        if (ascCode - offset) < 97 {  // in this case it will need to come down from the end
                    
            var decAscCode =  122 - (offset - (ascCode - 96))
            
                decAscCodes.append(decAscCode)
            
            
        }
        
        else {     // in this case we can simply remove the offset
        
            var decAscCode = ascCode - offset
            decAscCodes.append(decAscCode)

            
            
        }
        
        
    }

    var decodedMessage = ""


    for decAscCode in decAscCodes {  // iterate decrypted ascii codes to recontruct message
        
        var decChar = String(UnicodeScalar(decAscCode))
        decodedMessage = decodedMessage + decChar
        
    }


        decodedMessages[String(UnicodeScalar(letterCode))] = decodedMessage
        
        

}


decodedMessages  // outputs dictionary of each decrypter message for each common letter. 

//  to develop further, need to parse each for commom words and decide wich is valid english, choose right one and separate words from each other.


print("Tecumseh is the Man")

