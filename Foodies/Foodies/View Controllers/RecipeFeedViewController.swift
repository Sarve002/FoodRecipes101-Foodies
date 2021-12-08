//
//  RecipeFeedViewController.swift
//  Foodies
//
//  Created by Steven Arvelo on 11/13/21.
//

import UIKit
import AlamofireImage
import Parse

class RecipeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var numberOfrecipes = 10
    

    @IBOutlet var tableView: UITableView!
    @IBAction func onLogout(_ sender: Any) {
        
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewControl = main.instantiateViewController(withIdentifier: "LoginViewControl")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewControl
    }
    
    let myRefreshControl = UIRefreshControl()
    
    var recipesArray: [Recipes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        
        myRefreshControl.addTarget(self, action: #selector(getAPIData), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
        
        let favored = PFObject(className: "favorited")
        
        //print(recipesArray)
        // Do any additional setup after loading the view.
    }
    
    //update API to get an array of recipe objects
    @objc func getAPIData(){
        self.recipesArray.removeAll()
        API.getRecipes(numberRecipes: numberOfrecipes) { (recipes) in
            guard let recipes = recipes else {
                return
            }
            self.recipesArray = recipes
            self.tableView.reloadData()
            self.myRefreshControl.endRefreshing()
        }
    }
    
    func loadMoreRecipes(){
        numberOfrecipes = numberOfrecipes + 10
        API.getRecipes(numberRecipes: numberOfrecipes) { (recipes) in
            guard let recipes = recipes else {
                return
            }
            self.recipesArray.removeAll()
            for recipe in recipes {
                self.recipesArray.append(recipe)
            }
            self.tableView.reloadData()
            self.myRefreshControl.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row + 1 == recipesArray.count {
            loadMoreRecipes()
        }
    }
    
    
    
    //how many cells there will be
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create recipes cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        let recipe = recipesArray[indexPath.row]
        //cell.setFavorite(favor["Favorited"] as! Bool)
        
        cell.r = recipe
        return cell        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesArray.count
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // prepare data for recipeDetailSegue
        if segue.identifier == "recipeDetailSegue" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                let r = recipesArray[indexPath!.row]
                let detailViewController = segue.destination as! RecipeDetailViewController
                detailViewController.r = r
            }
        } else {
            print("do nothing")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
