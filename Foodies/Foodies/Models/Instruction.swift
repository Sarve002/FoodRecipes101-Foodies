//
//  Instruction.swift
//  Foodies
//
//  Created by G on 12/3/21.
//

import Foundation

class Instruction: NSObject {
    var number: Int
    var step: String
    
    init(dict: [String: Any]){
        number = dict["number"] as! Int
        step = dict["step"] as! String
    }
}
