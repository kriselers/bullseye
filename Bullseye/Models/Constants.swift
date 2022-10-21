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
        public static let initSliderValue = 50.0
        public static let initAlertIsVisible = false
        public static let minSliderValue = 1.0
        public static let maxSliderValue = 100.0
    }
    
    enum Scoring {
        public static let maximumScore = 100
        public static let exactBonus = 100
        public static let closeBonus = 50
    }
    
    enum Design {
        public static let strokeWidth = CGFloat(2.0)
        public static let vStackSpacing = CGFloat(10.0)
        
        public static let roundedViewLength = CGFloat(56.0)
        public static let roundRectViewWidth = CGFloat(68.0)
        public static let roundRectViewHeight = CGFloat(56.0)
        public static let roundRectCornerRadius = CGFloat(21.0)
        
        public static let instructionViewMinPadding = CGFloat(0.0)
        public static let instructionViewMaxPadding = CGFloat(100.0)
        public static let instructionViewPadding = CGFloat(30.0)
        public static let sliderViewPadding = CGFloat(15.0)
        public static let hitMeButtonPadding = CGFloat(20.0)
        
        public static let gradientOpacity = CGFloat(0.3)
    }
    
    enum Leaderboard {
        public static let leaderboardMaxEntries = 10
        public static let leaderboardScoreColWidth = CGFloat(70) // def: 50.0
        public static let leaderboardDateColWidth = CGFloat(130) // def: 170.0
        public static let leaderboardMaxRowWidth = CGFloat(480.0) // def: 480.0
    }
}
