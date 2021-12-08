//
//  RecipeCell.swift
//  Foodies
//
//  Created by Steven Arvelo on 11/20/21.
//

import UIKit
import Parse

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var r: Recipes! {
        didSet{
            //setting recipe name
            recipeName.text = r.title
            
            //gathering image information and sets them
            recipeImage.af.setImage(withURL: r.imageURL!)
            recipeImage.layer.cornerRadius = 10
            recipeImage.clipsToBounds = true
        }
    }
    
    @IBAction func favoredButton(_ sender: Any) {
        let toBeFavorited = !favorited
        let favor = PFObject(className: "Favorited")
        
        if(toBeFavorited){
            
            favor["Favorited"] = r.title
            
            favor.saveInBackground { (succeeded, error) in
                if (succeeded){
                    self.setFavorite(true) 
                }else {
                    print("error: \(error)" )
                }
            }
        }
    }
    
    var favorited:Bool = false

    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    //creating a recipe Variable and didSet

        
    override func awakeFromNib() {
        super.awakeFromNib()
        // initialize
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
