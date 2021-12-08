//
//  RecipeInstructionTableViewController.swift
//  Foodies
//
//  Created by G on 12/3/21.
//

import UIKit

class RecipeInstructionTableViewController: UITableViewController {

    @IBOutlet var instructionsTableView: UITableView!
    
    var r: Recipes!
    var instructions: [Instruction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instructionsTableView.delegate = self
        instructionsTableView.dataSource = self
        
        getInstructions()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getInstructions(){
        // Call the API.getInstructions() function, passing the id of the recipe
        // Fetch instructions from specific recipe using the given id
        print(r.id)
        API.getInstructions(id: r.id) { (instructions) in
            // If we don't get ingredients, return nothing
            guard let instructions = instructions else {
                return
            }
    
            // We get ingredients, then we set our
            // self.ingredients = ingredients (data from API --> view Controller)
            // and reload data
            self.instructions = instructions
            self.instructionsTableView.reloadData()
        }
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    // What will each cell have
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create recipes cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionTableViewCell") as! InstructionTableViewCell
        
        let instruction = instructions[indexPath.row]
        
        cell.instruct = instruction
        
        return cell
    }
    
    // how many rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instructions.count
        }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
     
        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
