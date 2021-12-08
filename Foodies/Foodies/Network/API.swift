//
//  API.swift
//  Foodies
//
//  Created by Steven Arvelo on 11/20/21.
//

import Foundation

struct API {
    
    static func getRecipes(numberRecipes: Int, completion: @escaping ([Recipes]?) -> Void){
        //API key!
        let apikey = "b66885343d594e15928ed80e4d8b6ae2"
        let numberOfRecipes = numberRecipes
        //creating the URL for the api
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?number=\(numberOfRecipes)&apiKey=\(apikey)&instructionsRequired")!

        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        //dealing with requests to the API
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //this will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data {
                //get data from API and return it using completion
                //1. convert json response to a dictionary
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //2. Grab the recipes data and convert it to an array of dictionaries for each recipe.
                let recDictionaries = dataDictionary["results"] as! [[String: Any]]
                //3. Completion is an escaping method which allows the data to be used outside of the closure
                var recipes: [Recipes] = []
                //use each recipe dictionary to initialize the recipe object
                for dictionary in recDictionaries {
                    let recipe = Recipes.init(dict: dictionary)
                    recipes.append(recipe)
                }
                
                return completion(recipes)
                
            }
        }
        task.resume()
        
    }// end getRecipes
    
    static func getIngredients(id: Int, completion: @escaping ([Ingredient]?) -> Void){
        //API key!
        let apikey = "b66885343d594e15928ed80e4d8b6ae2"
        let recipeID = id
        //creating the URL for the api
        let infoURL = URL(string: "https://api.spoonacular.com/recipes/\(recipeID)/information?apiKey=\(apikey)")!

        var infoRequest = URLRequest(url: infoURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        //dealing with requests to the API
        let infoSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let infoTask = infoSession.dataTask(with: infoRequest) { (data, response, error) in
            //this will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data {
                //get data from API and return it using completion
                //1. convert json response to a dictionary
                let dataInfoDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //2. Grab the recipes data and convert it to an array of dictionaries for each recipe.
                let infoDictionaries = dataInfoDictionary["extendedIngredients"] as! [[String: Any]]
                //3. Completion is an escaping method which allows the data to be used outside of the closure
                var ingredients: [Ingredient] = []
                //use each recipe dictionary to initialize the recipe object
                for dictionary in infoDictionaries {
                    let ingredient = Ingredient.init(dict: dictionary)
                    ingredients.append(ingredient)
                }
                
                return completion(ingredients)
            }
        }
        infoTask.resume()
    }// end Ingredients
     
    static func getInstructions(id: Int, completion: @escaping ([Instruction]?) -> Void){
        //API key!
        let apikey = "b66885343d594e15928ed80e4d8b6ae2"
        let recipeID = id
        //creating the URL for the api
        let infoURL = URL(string: "https://api.spoonacular.com/recipes/\(recipeID)/analyzedInstructions?apiKey=\(apikey)")!

        var infoRequest = URLRequest(url: infoURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        //dealing with requests to the API
        let infoSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let infoTask = infoSession.dataTask(with: infoRequest) { (data, response, error) in
            //this will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data {
                print(type(of: data))
                //get data from API and return it using completion
                // 1. convert json response to a dictionary
                let dataInfoArray = try! JSONSerialization.jsonObject(with: data, options: []) as! [Dictionary<String, Any>]
                            
                var instructions: [Instruction] = []
                
                // prevent crashing from empty array/no recipe instruction
                if dataInfoArray.isEmpty {
                    print("no info")
                } else {
                    let dataInfoDictionary = dataInfoArray[0] as! [String: Any]
                    let stepsInfoArray = dataInfoDictionary["steps"] as! [Any]
                    //use each recipe dictionary to initialize the recipe object
                    for dictionary in stepsInfoArray {
                        let instruction = Instruction.init(dict: dictionary as! [String : Any])
                        instructions.append(instruction)
                    }
                }
                // 3. Completion is an escaping method which allows the data to be used outside of the closure
                return completion(instructions)
            }
        }
        infoTask.resume()
    }// end Instructions
    

    
}// end struct
