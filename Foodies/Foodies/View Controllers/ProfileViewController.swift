//
//  ProfileViewController.swift
//  Foodies
//
//  Created by G on 11/30/21.
//

import UIKit

class ProfileViewController: UIViewController {

    var r: Recipes!
    var recipesArray: [Recipes] = []
    
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
