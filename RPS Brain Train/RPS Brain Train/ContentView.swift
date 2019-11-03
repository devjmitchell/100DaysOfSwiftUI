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
    
    @State private var score = 0
    @State private var rightAnswerCount = 0
    @State private var wrongAnswerCount = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                HStack(spacing: 20) {
                    Text("Score:")
                    Text("\(score)")
                        .foregroundColor(score > 0 ? .green : .red)
                }
                
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
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("New Game")) {
                    self.clearScore()
                    self.showNextQuestion()
                    })
            }
        }
    }
    
    private func guess(_ choice: Choice) {
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
            score += 1
            rightAnswerCount += 1
        } else {
            score -= 1
            wrongAnswerCount += 1
        }
        
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        if (rightAnswerCount + wrongAnswerCount) < 10 {
            computerChoice = Choice.allCases.randomElement()!
            shouldWin = Bool.random()
        } else {
            alertTitle = "Final Score: \(score)"
            alertMessage = "You got\n\(rightAnswerCount) right 😁\n\(wrongAnswerCount) wrong 😢"
            
            showingAlert = true
        }
    }
    
    private func clearScore() {
        score = 0
        rightAnswerCount = 0
        wrongAnswerCount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
