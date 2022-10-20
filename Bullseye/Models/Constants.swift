//
//  Models.swift
//  Bullseye
//
//  Created by Kristopher Elers on 10/11/22.
//

import Foundation
import UIKit

enum Constants {
    enum General {
        public static let strokeWidth = CGFloat(2.0)
        public static let roundedViewLength = CGFloat(56.0)
        public static let roundRectViewWidth = CGFloat(68.0)
        public static let roundRectViewHeight = CGFloat(56.0)
        public static let roundRectCornerRadius = CGFloat(21.0)
    }
    
    enum Leaderboard {
        public static let leaderboardMaxEntries = 10
        public static let leaderboardScoreColWidth = CGFloat(70) // def: 50.0
        public static let leaderboardDateColWidth = CGFloat(130) // def: 170.0
        public static let leaderboardMaxRowWidth = CGFloat(480.0) // def: 480.0
    }
}
