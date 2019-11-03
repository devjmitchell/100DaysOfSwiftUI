//
//  ContentView.swift
//  RPS Brain Train
//
//  Created by Jason Mitchell on 11/2/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    #warning("use enum instead?")
    private let choices = ["✊", "✋", "✌️"]
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var correctAnswerCount = 0
    @State private var totalAnswerCount = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
//    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Text("Score: \(correctAnswerCount) / \(totalAnswerCount)")
            Text(choices[computerChoice])
            Text("Try to \(shouldWin ? "WIN" : "LOSE")")
            
            HStack {
                ForEach(0 ..< choices.count) { number in
                    Button(action: {
                        self.guess(number)
                    }) {
                        Text(self.choices[number])
                    }
                    
                }
            }
            
            Spacer()
        }
        .font(.largeTitle)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), dismissButton: .default(Text("Continue")) {
                self.nextTry()
            })
        }
    }
    
    func guess(_ number: Int) {
        totalAnswerCount += 1
        
        let correctNumber: Int
        
        switch computerChoice {
        case 0:
            correctNumber = shouldWin ? 1 : 2
        case 1:
            correctNumber = shouldWin ? 2 : 0
        default:
            correctNumber = shouldWin ? 0 : 1
        }
        
        if number == correctNumber {
            correctAnswerCount += 1
            alertTitle = "Right!"
        } else {
            alertTitle = "Wrong!"
        }
        
        showingAlert = true
    }
    
    func nextTry() {
        computerChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
