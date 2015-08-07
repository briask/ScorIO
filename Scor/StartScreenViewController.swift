//
//  StartScreenViewController.swift
//  Scor
//
//  Created by Brian Skehan on 05/08/2015.
//  Copyright © 2015 Brian Skehan. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet weak var HomeTeamNameTxt: UITextField!
    
    @IBOutlet weak var AwayTeamNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newProgramVar = HurlingMatch()
        
        newProgramVar.HomeTeamName = HomeTeamNameTxt.text!
        newProgramVar.AwayTeamName = AwayTeamNameTxt.text!
        
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destinationViewController as! HurlingMatchTabController
        destinationVC.theMatch = newProgramVar
    }
    
    @IBAction func StartMatch(sender: UIButton) {
    }
}
