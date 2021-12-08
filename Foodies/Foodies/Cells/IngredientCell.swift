//
//  IngredientsCellTableViewCell.swift
//  Foodies
//
//  Created by G on 12/2/21.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    // UI Elements
    @IBOutlet weak var ingredientLabel: UILabel!
    
    
    
    //creating an ingredient Variable and didSet
    var i: Ingredient! {
        didSet{
            self.ingredientLabel.text = i.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // initialize
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

