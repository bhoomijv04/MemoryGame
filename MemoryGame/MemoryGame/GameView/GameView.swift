//
//  GameView.swift
//  MemoryGame
//
//  Created by Bhoomi Vadgama on 23/06/24.
//

import SwiftUI
import Combine

public struct GameView: View {
    
    @ObservedObject private var viewModel: GameViewModel
    
    private let adaptiveColumn = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    public init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var gridSize: Int {
        8
    }
    
    public var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ScrollView {
                        VStack {
                            gameView
                        }
                    }
                }
            }
            .task {
                viewModel.startGame()
            }
            .alert(isPresented: $viewModel.showAlert) {
                gameEndAlert
            }
            .padding()
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .navigationTitle("Memory Game")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    private var gameView: some View {
        LazyVGrid(columns: adaptiveColumn, spacing: 5) {
           ForEach(0..<self.viewModel.cardData.count, id: \.self) { index in
                let viewModel = viewModel.cardData[index]
                GameImageView(imageViewModel: viewModel)
                    .onTapGesture {
                        self.viewModel.handleCardTap(index: index)
                    }
            }
        }
        .padding(.horizontal)
    }
    
    private var gameEndAlert: Alert {
        if self.viewModel.matchedPairs.count == 0 {
            return Alert(title: Text("Congratulations!"),
                         message: Text("You've matched all pairs"),
                         primaryButton: .default(Text("Restart")) {
                self.viewModel.startGame()
            }, secondaryButton: .cancel {})
        } else {
            return Alert(title: Text("Time's Up!"),
                         message: Text("You've matched few pairs"),
                         primaryButton: .default(Text("Restart")) {
                self.viewModel.startGame()
            },secondaryButton: .cancel {})
        }
    }
}
