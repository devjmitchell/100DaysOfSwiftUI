//
//  ContentView.swift
//  RPS Brain Train
//
//  Created by Jason Mitchell on 11/2/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import SwiftUI

private enum Choice: String, CaseIterable {
    case rock = "✊"
    case paper = "✋"
    case scissors = "✌️"
}

struct ContentView: View {
    @State private var computerChoice = Choice.allCases.randomElement()!
    @State private var shouldWin = Bool.random()
    
    @State private var correctAnswerCount = 0
    @State private var totalAnswerCount = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                Text("Score: \(correctAnswerCount) / \(totalAnswerCount)")
                
                Text(computerChoice.rawValue)
                    .font(.system(size: 150))
                
                Text("Try to \(shouldWin ? "WIN" : "LOSE")")
                
                HStack(spacing: 20) {
                    ForEach(0..<Choice.allCases.count) { number in
                        Button(action: {
                            self.guess(Choice.allCases[number])
                        }) {
                            Text(Choice.allCases[number].rawValue)
                        }
                    }
                }
                .font(.system(size: 80))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .font(.system(size: 50))
            .foregroundColor(.white)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
                    self.showNextQuestion()
                    })
            }
        }
    }
    
    private func guess(_ choice: Choice) {
        totalAnswerCount += 1
        
        let correctChoice: Choice
        
        switch computerChoice {
        case .rock:
            correctChoice = shouldWin ? .paper : .scissors
        case .paper:
            correctChoice = shouldWin ? .scissors : .rock
        case .scissors:
            correctChoice = shouldWin ? .rock : .paper
        }
        
        if choice == correctChoice {
            correctAnswerCount += 1
            alertTitle = "Right!"
            alertMessage = "Great job!"
        } else {
            alertTitle = "Wrong!"
            alertMessage = "The correct answer was \(correctChoice.rawValue)"
        }
        
//        showingAlert = true
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        if totalAnswerCount < 10 {
            computerChoice = Choice.allCases.randomElement()!
            shouldWin = Bool.random()
        } else {
            startNewGame()
        }
    }
    
    private func startNewGame() {
        alertTitle = "Game Over"
        alertMessage = "You got \(correctAnswerCount) right out of 10"
        
        totalAnswerCount = 0
        correctAnswerCount = 0
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
