//
//  HurlingMatch.swift
//  Scor
//
//  Created by Brian Skehan on 04/08/2015.
//  Copyright © 2015 Brian Skehan. All rights reserved.
//

import Foundation

class HurlingMatch: NSObject {
    
    var HomeTeamName : String = ""
    var AwayTeamName : String = ""
    
    var HomeTeamPoints: Int = 0
    var HomeTeamGoals: Int = 0
    
    var AwayTeamPoints: Int = 0
    var AwayTeamGoals: Int = 0
    
    var MatchLength: Int = 0
    
    var MatchCommentary = [String]()
    
    func CreateMatchComment(matchEvent: String) -> String {
        var comment: String = ""
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm "
        
        let dateString = dateFormatter.stringFromDate(NSDate())
        comment += dateString + " "
        comment += matchEvent
        comment += HomeTeamName + " " + GetHomeTeamScoreForDisplay() + " "
        comment += AwayTeamName + " " + GetAwayTeamScoreForDisplay()
        
        MatchCommentary.append(comment)
        
        return comment
    }
    
    func GetMatchSummary() -> String {
        
        let diff = abs(GetAwayScoreTotal() - GetHomeScoreTotal())
        var pointTxt = "points."
        if (diff == 1) {
            pointTxt = "point."
        }
        
        if (GetHomeScoreTotal() == GetAwayScoreTotal()) {
            return "Sides are level"
        }
        else if (GetHomeScoreTotal() > GetAwayScoreTotal())
        {
            return "\(HomeTeamName) are ahead by \(diff) \(pointTxt)"
        }
        else {
            return "\(AwayTeamName) are ahead by \(diff) \(pointTxt)"
        }
    }
    
    func GetHomeScoreTotal() -> Int {
        return (HomeTeamGoals * 3) + HomeTeamPoints
    }

    func GetAwayScoreTotal() -> Int {
        return (AwayTeamGoals * 3) + AwayTeamPoints
    }
    
    func GetHomeTeamScoreForDisplay() -> String
    {
        let score: String = "\(String(HomeTeamGoals)) : \(String(HomeTeamPoints))"

        return score
    }
    
    func GetAwayTeamScoreForDisplay() -> String
    {
        let score: String = "\(String(AwayTeamGoals)) : \(String(AwayTeamPoints))"
        
        return score
    }
    
    func AddHomePoint()
    {
        HomeTeamPoints += 1
    }
    
    func RemoveHomePoint()
    {
        HomeTeamPoints -= 1
        if (HomeTeamPoints <= 0){
            HomeTeamPoints = 0
        }
    }
    
    func AddAwayPoint()
    {
        AwayTeamPoints += 1
    }
    
    func RemoveAwayPoint()
    {
        AwayTeamPoints -= 1
        if (AwayTeamPoints <= 0){
            AwayTeamPoints = 0;
        }
    }
    
    func AddHomeGoal()
    {
        HomeTeamGoals += 1
    }
    
    func RemoveHomeGoal()
    {
        HomeTeamGoals -= 1
        if (HomeTeamGoals <= 0){
            HomeTeamGoals = 0
        }
    }
    
    func AddAwayGoal()
    {
        AwayTeamGoals += 1
    }
    
    func RemoveAwayGoal()
    {
        AwayTeamGoals -= 1
        if (AwayTeamGoals <= 0)
        {
            AwayTeamGoals = 0
        }
    }
}