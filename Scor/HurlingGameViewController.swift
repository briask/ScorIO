//
//  HurlingGameViewController.swift
//  Scor
//
//  Created by Brian Skehan on 05/08/2015.
//  Copyright © 2015 Brian Skehan. All rights reserved.
//

import UIKit

class HurlingGameViewController: UIViewController {

    var theGame : HurlingMatch?
    
    @IBOutlet weak var AwayTeamLbl: UILabel!
    @IBOutlet weak var HomeTeamLbl: UILabel!
    
    @IBOutlet weak var GameSummaryLbl: UILabel!
    
    @IBOutlet weak var HomeScoreBtn: UIButton!
    @IBOutlet weak var AwayScoreBtn: UIButton!
    
    @IBOutlet weak var HomeScoreTotalLbl: UILabel!
    @IBOutlet weak var AwayScoreTotalLbl: UILabel!
    
    @IBOutlet weak var GameCommentaryTbl: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller  = self.tabBarController as! HurlingMatchTabController
        
        theGame = controller.theMatch
        
        HomeTeamLbl.text = theGame?.HomeTeamName
        AwayTeamLbl.text = theGame?.AwayTeamName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HomeGoalBtn(sender: UIButton) {
        theGame?.AddHomeGoal()
        
        let currentScore = theGame?.GetHomeTeamScoreForDisplay()
        HomeScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
    }
    
    @IBAction func HomePointBtn(sender: UIButton) {
        theGame?.AddHomePoint()
        
        let currentScore = theGame?.GetHomeTeamScoreForDisplay()
        HomeScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
    }
    
    @IBAction func AwayGoalBtn(sender: UIButton) {
        theGame?.AddAwayGoal()
        
        let currentScore = theGame?.GetAwayTeamScoreForDisplay()
        AwayScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
    }
    
    @IBAction func AwayPointBtn(sender: UIButton) {
        theGame?.AddAwayPoint()
        
        let currentScore = theGame?.GetAwayTeamScoreForDisplay()
        AwayScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
