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
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            for i in 1...Constants.Leaderboard.leaderboardMaxEntries {
                leaderboardEntries.append(LeaderboardEntry(score: updateRandInt(), round: i, date: Date()))
            }
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let maximumScore = 100

        switch amountOff(sliderValue: sliderValue) {
        case 0:
            return (maximumScore - amountOff(sliderValue: sliderValue)) + 100
        case 1...2:
            return (maximumScore - amountOff(sliderValue: sliderValue)) + 50
        default:
            return maximumScore - amountOff(sliderValue: sliderValue)
        }
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, round: round, date: Date()))
        leaderboardEntries.sort { ($0.score/$0.round) > ($1.score/$1.round)}
        if leaderboardEntries.count > Constants.Leaderboard.leaderboardMaxEntries { leaderboardEntries.removeLast() }
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
        Int.random(in: 1...100)
    }
}
