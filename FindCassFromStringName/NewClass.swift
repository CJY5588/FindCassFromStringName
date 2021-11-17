//
//  NewClass.swift
//  FindCassFromStringName
//
//  Created by jianyi.chen on 2021/11/17.
//

import Cocoa

class NewClass: NSObject {
    
    @objc func testFunction() {
       print("this is a new class")
    }
    
    @objc func testFunction2(_ parameter:String) {
       print("this is a new class, parameter:", parameter)
    }
    
    @objc func testFunction3() -> String {
       return "Hello World!"
    }
}
