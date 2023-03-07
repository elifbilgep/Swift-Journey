//
//  main.swift
//  ProtocolSwiftProject
//
//  Created by Elif Bilge Parlak on 4.03.2023.
//

import Foundation


protocol Running{
    func myRun()
}

class Animal{
    func test(){
        print("test")
    }
    func running(){
        print("class running")
    }
    

}

class Dog : Running{
    func myRun() {
        print("frpm   running")
    }
}

class Cat : Animal, Running{
    func myRun() {
        print("protokol running")
    }
    
    
}

class Turtle : Animal{
    
}

struct Bird : Running{
    func myRun() {
        print("myRun")
    }
}
let cat = Cat()
let duman = Dog()
let leo = Turtle()
let fistik = Bird()

cat.myRun()
cat.test()
fistik.myRun()
