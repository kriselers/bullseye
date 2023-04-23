//
//  Game.swift
//  Bullseye
//
//  Created by Kristopher Elers on 10/10/22.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let round: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: Int(Constants.General.minSliderValue)...Int(Constants.General.maxSliderValue))
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            for i in 1...Constants.Leaderboard.MaxEntries {
                leaderboardEntries.append(LeaderboardEntry(score: updateRandInt(), round: i, date: Date()))
            }
        }
    }
    
    func points(sliderValue: Int) -> Int {
        switch amountOff(sliderValue: sliderValue) {
        case 0:
            return (Constants.Scoring.maximumScore - amountOff(sliderValue: sliderValue)) + Constants.Scoring.exactBonus
        case 1...2:
            return (Constants.Scoring.maximumScore - amountOff(sliderValue: sliderValue)) + Constants.Scoring.closeBonus
        default:
            return Constants.Scoring.maximumScore - amountOff(sliderValue: sliderValue)
        }
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, round: round, date: Date()))
        leaderboardEntries.sort { ($0.score/$0.round) > ($1.score/$1.round)}
        if leaderboardEntries.count > Constants.Leaderboard.MaxEntries { leaderboardEntries.removeLast() }
    }
    
    mutating func restart(points: Int) {
        addToLeaderboard(points: score)
        score = 0
        round = 1
        target = updateRandInt()
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = updateRandInt()
    }
    
    // Helper Functions    
    func amountOff(sliderValue: Int) -> Int {
        abs(target - sliderValue)
    }
    
    
    func updateRandInt() -> Int {
        Int.random(in: Int(Constants.General.minSliderValue)...Int(Constants.General.maxSliderValue))
    }
}
