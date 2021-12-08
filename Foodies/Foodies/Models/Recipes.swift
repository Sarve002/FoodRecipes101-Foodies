//
//  Recipes.swift
//  Foodies
//
//  Created by Steven Arvelo on 11/20/21.
//

import Foundation

class Recipes {
    var id: Int
    var title: String
    var imageURL: URL?
    //var name: String
    var mainRecipes: NSNumber
    
    init(dict: [String: Any]){
        id = dict["id"] as! Int
        title = dict["title"] as! String
        imageURL = URL(string: dict["image"] as! String)
        //name = dict["name"] as! String
        mainRecipes = Recipes.getMainRecipes(dict: dict)
    }
    
    static func getMainRecipes(dict: [String:Any]) -> NSNumber {
        let id = dict["id"] as! NSNumber
        return id
    }
    
}
