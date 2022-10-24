 import UIKit

//WHILE LOOP

var number = 0

while number <= 10{
    number = number + 1
}

var characterAlive = true

while characterAlive == true{
  //  print("Character is alive")
    characterAlive = false
}

//FOR LOOP

var myFruitsArray = ["Banana","Apple","Orange"]

for fruit in myFruitsArray{
    print(fruit)
}

var mySet = ["Apple": "fruit","tomato": "veggie"]

for set in mySet{
    print(set.key)
}

var myNumbers = [10,20,30,40,50]

for num in myNumbers{
    print(num / 5)
}

for myNewInteger in 1...5{
    print(myNewInteger)
}
