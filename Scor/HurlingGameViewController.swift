//
//  HurlingGameViewController.swift
//  Scor
//
//  Created by Brian Skehan on 05/08/2015.
//  Copyright © 2015 Brian Skehan. All rights reserved.
//

import UIKit

class HurlingGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var theGame : HurlingMatch?
    
    @IBOutlet weak var AwayTeamLbl: UILabel!
    @IBOutlet weak var HomeTeamLbl: UILabel!
    
    @IBOutlet weak var GameSummaryLbl: UILabel!
    
    @IBOutlet weak var HomeScoreBtn: UIButton!
    @IBOutlet weak var AwayScoreBtn: UIButton!
    
    @IBOutlet weak var HomeScoreTotalLbl: UILabel!
    @IBOutlet weak var AwayScoreTotalLbl: UILabel!
    
    @IBOutlet weak var GameCommentaryTbl: UITableView!
    
    @IBOutlet weak var TimePlayedLbl: UILabel!
    @IBOutlet weak var TimeInHalfLbl: UILabel!
    
    var startTime = NSTimeInterval()
    
    var elapsedTimeInHalf = [NSTimeInterval](count: 4, repeatedValue: 0.0)
    
    var timer = NSTimer()
    
    var halfIndicator: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller  = self.tabBarController as! HurlingMatchTabController
        
        theGame = controller.theMatch
        
        HomeTeamLbl.text = theGame!.HomeTeamName
        AwayTeamLbl.text = theGame!.AwayTeamName
        
        self.GameCommentaryTbl.delegate = self
        self.GameCommentaryTbl.dataSource = self
        
        TimePlayedLbl.text = "00:00"
        TimeInHalfLbl.text = String(controller.theMatch.MatchLength) + ":00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HomeGoalBtn(sender: UIButton) {
        theGame!.AddHomeGoal()
        
        let currentScore = theGame!.GetHomeTeamScoreForDisplay()
        HomeScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
        GameSummaryLbl.text = theGame!.GetMatchSummary()
        theGame!.CreateMatchComment("GOAL! ")
        GameCommentaryTbl.reloadData()
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        GameCommentaryTbl.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
    }
    
    @IBAction func HomePointBtn(sender: UIButton) {
        theGame!.AddHomePoint()
        
        let currentScore = theGame?.GetHomeTeamScoreForDisplay()
        HomeScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
        GameSummaryLbl.text = theGame!.GetMatchSummary()
        theGame!.CreateMatchComment("Point! ")
        GameCommentaryTbl.reloadData()
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        GameCommentaryTbl.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
    }
    
    @IBAction func AwayGoalBtn(sender: UIButton) {
        theGame!.AddAwayGoal()
        
        let currentScore = theGame!.GetAwayTeamScoreForDisplay()
        AwayScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
        GameSummaryLbl.text = theGame!.GetMatchSummary()
        theGame!.CreateMatchComment("GOAL! ")
        GameCommentaryTbl.reloadData()

    }
    
    @IBAction func AwayPointBtn(sender: UIButton) {
        theGame!.AddAwayPoint()
        
        let currentScore = theGame!.GetAwayTeamScoreForDisplay()
        AwayScoreBtn.setTitle(currentScore, forState: UIControlState.Normal)
        GameSummaryLbl.text = theGame?.GetMatchSummary()
        theGame!.CreateMatchComment("Point! ")
        GameCommentaryTbl.reloadData()
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        GameCommentaryTbl.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
    }

    @IBAction func StartBtn(sender: UIButton) {
        let aSelector : Selector = "UpdateTimer"
        
        if (!timer.valid){
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    
    @IBAction func StopBtn(sender: UIButton) {
        timer.invalidate()
    }
    
    func UpdateTimer() {
        
        var elapsedTime = elapsedTimeInHalf[0]
        elapsedTimeInHalf[0] = elapsedTimeInHalf[0] + 1
        
        let minutes = Int(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minutes) * 60)

        //calculate the seconds in elapsed time.
        let seconds = Int(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        if (minutes > theGame?.MatchLength) {
            TimePlayedLbl.textColor = UIColor.redColor()
        }
        else {
            TimePlayedLbl.textColor = UIColor(red:0.42, green:1.0, blue:0.3, alpha:1.0)
        }
        
        TimePlayedLbl.text = GenerateTimeForDisplay(minutes, seconds: seconds)
    }
    
    func GenerateTimeForDisplay(minutes: Int, seconds: Int) -> String {
    
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
    
        return "\(strMinutes):\(strSeconds)"
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (theGame?.MatchCommentary.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath)
        let index = (theGame?.MatchCommentary.count)! - indexPath.row - 1
        
        cell.textLabel?.text = theGame?.MatchCommentary[index]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        
        return cell
    }
    
    @IBAction func HalfIndicatorChanged(sender: UISegmentedControl) {
        let halfSegment = sender
        
        if (halfSegment.selectedSegmentIndex >= 0) {
            halfIndicator = halfSegment.selectedSegmentIndex + 1
            TimeInHalfLbl.text = String(theGame!.MatchLength) + ":00"
        }
    }
}
