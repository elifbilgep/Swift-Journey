import UIKit

func sum(num1: Int, num2: Int) -> Int{
    return num1 + num2
}


func calculate(num1: Int, num2: Int, myFunction: (Int, Int) -> Int) -> Int {
    return num1 + num2
}


//calculate(num1: 5, num2: 2, myFunction: sum)

calculate(num1: 5, num2: 2, myFunction: {
    (num1: Int, num2: Int) -> Int in
    return num1 * num2
})

calculate(num1: 5, num2: 2, myFunction: {
    (num1, num2 ) -> Int in
    return num1 * num2
})

calculate(num1: 5, num2: 2, myFunction: {
    (num1, num2 ) in
    return num1 * num2
})

calculate(num1: 5, num2: 2, myFunction: {(num1, num2 ) in num1 * num2})

calculate(num1: 5, num2: 2, myFunction: {$0 * $1})


/*{
    (num1: Int, num2: Int) -> Int in
    return num1 * num2
}*/

let myArray = [10,20,30,40]

func test(num1: Int) -> Int{
    return num1 / 5
}

myArray.map(test)
