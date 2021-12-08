//
//  InstructionTableViewCell.swift
//  Foodies
//
//  Created by G on 12/3/21.
//

import UIKit



class InstructionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    
    //creating an ingredient Variable and didSet
    var instruct: Instruction! {
        didSet{
            numberLabel.text = String(Int(instruct.number))
            stepLabel.text = instruct.step
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
