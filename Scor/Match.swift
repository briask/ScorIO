//
//  Match.swift
//  Scor
//
//  Created by Brian Skehan on 04/08/2015.
//  Copyright © 2015 Brian Skehan. All rights reserved.
//

import Foundation

protocol Match {
    static var HomeTeamName : String {get set}
    static var AwayTeamName : String {get set}
    
    static var HomeTeamPoints: Int {get set}
    static var HomeTeamGoals: Int {get set}
    
    static var AwayTeamPoints: Int {get set}
    static var AwayTeamGoals: Int {get set}
    
    static func GetHomeTeamScoreForDisplay() -> String
    static func GetAwayTeamScoreForDisplay() -> String
    
    static func AddHomePoint()
    static func RemoveHomePoint()
    
    static func AddAwayPoint()
    static func RemoveAwayPoint()
    
    static func AddHomeGoal()
    static func RemoveHomeGoal()
    
    static func AddAwayGoal()
    static func RemoveAwayGoal()
    
}