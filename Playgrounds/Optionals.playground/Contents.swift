import UIKit

var myName : String?

myName?.uppercased()


var myAge = "5a"

var myIntAge = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge){
    print(myNumber*5)
}else{
    print("wrong input")
}
