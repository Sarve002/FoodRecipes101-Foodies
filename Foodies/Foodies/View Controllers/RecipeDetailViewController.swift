//
//  RecipeDetailViewController.swift
//  Foodies
//
//  Created by Steven Arvelo on 11/21/21.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeInformation: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    var r: Recipes!
    var ingredients: [Ingredient] = []
    
    
    // Optional, delete later if you want
    var ingredientNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        // Adds "black tint" to our image (similar to car tint)
        darken(image: recipeImage)
        recipeImage.af.setImage(withURL: r.imageURL!)
        recipeLabel.text = r.title
        
        // Get ingredients from API function (make our viewDidLoad cleaner)
        getIngredients()
        
    }
    
    func getIngredients(){
        // Call the API.getIngredients() function, passing the id of the recipe
        // Fetch ingredients from specific recipe using the given id
        API.getIngredients(id: r.id) { (ingredients) in
            // If we don't get ingredients, return nothing
            guard let ingredients = ingredients else {
                return
            }
    
            // We get ingredients, then we set our
            // self.ingredients = ingredients (data from API --> view Controller)
            // and reload data
            self.ingredients = ingredients
            self.ingredientTableView.reloadData()
        }
    }
    
    // Function for adding black tint to our image as background
    func darken(image: UIImageView) {
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.40)
        tintView.frame = CGRect(x: 0, y: 0, width: image.frame.width, height: image.frame.height)
        image.addSubview(tintView)
    }
    
    // What will each cell have
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create recipes cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as! IngredientCell
        
        let ingredient = ingredients[indexPath.row]
        
        cell.i = ingredient
        
        return cell
    }
    
    //how many cells there will be
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
//         let cell = sender as! UITableViewCell
//         if let indexPath = tableView.indexPath(for: cell) {
//             let r = recipesArray[indexPath.row]
//             let intructionViewController = segue.destination as! RecipeInstructionTableViewController
//             intructionViewController.r = r
//         }
         let recipeInstructionsVC = segue.destination as! RecipeInstructionTableViewController
         recipeInstructionsVC.r = r
     }
     
    
    
    // Optional, delete later if you want
}
