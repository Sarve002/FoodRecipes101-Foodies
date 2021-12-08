//
//  LikedRecipesCell.swift
//  Foodies
//
//  Created by Steven Arvelo on 12/6/21.
//

import UIKit

class LikedRecipesCell: UITableViewCell {

    
    @IBOutlet weak var savedRecipe: UILabel!
    
    var pullRecipe : Recipes! {
        didSet{
            savedRecipe.text = pullRecipe.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
