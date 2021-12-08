//
//  Recipe2.swift
//  Foodies
//
//  Created by G on 11/30/21.
//

import Foundation

class Ingredient {
    var name: String
    

    
    init(dict: [String: Any]){
        name = dict["original"] as! String
    }
    
}
