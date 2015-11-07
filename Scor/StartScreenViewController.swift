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
    
    @IBOutlet weak var MatchLengthSeg: UISegmentedControl!
    
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
        
        let hurlingMatch = HurlingMatch()
        
        hurlingMatch.HomeTeamName = HomeTeamNameTxt.text!
        hurlingMatch.AwayTeamName = AwayTeamNameTxt.text!
        
        if (hurlingMatch.HomeTeamName.characters.count == 0){
            hurlingMatch.HomeTeamName = "Home";
        }
        
        if (hurlingMatch.AwayTeamName.characters.count == 0){
            hurlingMatch.AwayTeamName = "Away";
        }
        
        var length = MatchLengthSeg.selectedSegmentIndex
        switch (length) {
            case 0: length = 10
            case 1: length = 15
            case 2: length = 20
            case 3: length = 25
            case 4: length = 30
            case 5: length = 35
            default: length = 30
        }
        
        hurlingMatch.MatchLength = length
        
        let destinationVC = segue.destinationViewController as! HurlingMatchTabController
        destinationVC.theMatch = hurlingMatch
    }
    
    @IBAction func StartMatch(sender: UIButton) {
    }
}
