//
//  ContentView.swift
//  Bullseye
//
//  Created by Kristopher Elers on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = Constants.General.initAlertIsVisible
    @State private var sliderValue = Constants.General.initSliderValue
    @State private var game = Game()
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? Constants.Design.instructionViewMinPadding : Constants.Design.instructionViewMaxPadding)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible,
                                sliderValue: $sliderValue,
                                game: $game)
                    .transition(.scale)
                }
            }
            if !alertIsVisible {
                let isPortrait = horizontalSizeClass == .compact && verticalSizeClass == .regular
                SliderView(sliderValue: $sliderValue)
                    .padding(isPortrait ? .bottom : .top, Constants.Design.sliderViewPadding)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                .padding(.leading, Constants.Design.instructionViewPadding)
                .padding(.trailing, Constants.Design.instructionViewPadding)
            BigNumberText(text: "\(game.target)")
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: Constants.General.minSliderValue...Constants.General.maxSliderValue)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button("Hit me!".uppercased()) {
            withAnimation {
                alertIsVisible = true                
            }
        }
        .bold()
        .padding(Constants.Design.hitMeButtonPadding)
        .font(.title3)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(Constants.Design.gradientOpacity), Color.clear]),
                               startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.Design.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.Design.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.Design.strokeWidth)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
