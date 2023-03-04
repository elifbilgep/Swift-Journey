//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Elif Bilge Parlak on 1.03.2023.
//

import Foundation

let classJames = MusicianClass(name: "James", age: 32, instrument: "Violin")

var structJames = MusicianStruct(name: "James", age: 32, instrument: "Violin")

//print(structJames.age)

//structJames.age = 52

//print(structJames.age)

//Reference vs Value

/*let copyOfClassJames = classJames

var copyOfStructJames = structJames

print("c: " + String(copyOfClassJames.age))
print("s: " + String(copyOfStructJames.age))

copyOfClassJames.age = 52
copyOfStructJames.age = 52

print("c: " + String(classJames.age))
print("s: " + String(structJames.age))
*/

//Function vs Mutating Function

//print(classJames.age)
//classJames.happyBirthday()
//print(classJames.age)

//print(structJames.age)
//structJames.happyBirthday()
//print(structJames.age)


//TUPLE birden fazla veriyi tutuyo
let myTuple = (1,3)
var myTuple2 = (1,3,5)
myTuple2.2 = 10
//print(myTuple2.2)
let myTuple3 = ("Elif",20)
//print(myTuple.0)
let myTuple4 = (10,[10,20,30])
//print(myTuple4.1[1])

let tuple: (String, String)
tuple.0 = "elif"
tuple.1 = "bilge"

let newTuple = (name: "James", metallica: true)
//print(newTuple.metallica)

// GUARD LET VS IF LET
let myNumber = 5

func convertToIntGuard(stringInput : String) -> Int{
    guard let myInt = Int(stringInput) else {
        return 0
    }
    return myInt
}

func convertToIntIf(stringInput : String) -> Int{
    if let myInt = Int(stringInput){
        return myInt
    }else{
        return 0
    }
}


//print(convertToIntIf(stringInput: "5"))
//print(convertToIntGuard(stringInput: "5"))

//Switch Case
/*
let myNum = 11

//remainder
let myRemainder = myNum % 5

switch myRemainder{
case 1:
    print("its 1")
case 2:
    print("its 2")
case 1...3:
    print("its between 1 and 3")
default:
    print("none")
}
 */

//BREAKPOINT
var x = 5

print(x)

x += 1

print(x)
