//
//  GameViewModel.swift
//  MemoryGame
//
//  Created by Bhoomi Vadgama on 23/06/24.
//

import Foundation

public final class GameViewModel: ObservableObject {
    
    var totalCard: Int { 6 }
    var pairCards: Int { Int(floor(Double(totalCard)/2)) }
    
    public enum RouteType {}
    public enum GameViewState: Equatable {
        case noContent
        case success
        case error
    }
    
    var cardIndex: [Int] = []
    var matchedPairs: [Int] = []
    var flippedCard:[Int] = []
    
    @Published var cardData: [GameImageViewModel] = []
    @Published var showAlert: Bool = false
    
    public let coordinator: any SwiftUIEnqueueCoordinator<GameViewModel.RouteType>
    
    public init(coordinator: any SwiftUIEnqueueCoordinator<GameViewModel.RouteType>) {
        self.coordinator = coordinator
    }
    
    func handleCardTap(index: Int) {
        if self.flippedCard.count > 0 {
            if let existingIndex = self.flippedCard.first {
                let existingModel = self.cardData[existingIndex]
                var currentViewModel = self.cardData[index]
                currentViewModel.faceUp = true
                if currentViewModel.matchingIndex == existingModel.matchingIndex {
                    // matched
                    self.flippedCard.removeAll()
                    let sameCard = self.cardIndex[existingIndex]
                    self.matchedPairs.removeAll { value in
                        return value == sameCard
                    }
                    var data = self.cardData
                    data[index] = currentViewModel
                    self.cardData = data
                    
                    //End Game
                    if self.matchedPairs.count == 0 {
                        self.showAlert = true
                    }
                } else {
                    // not matched
                    self.updateModel(existingIndex: existingIndex, currentIndex: index)
                }
            } else {
                // not matched
                if let existingIndex = self.flippedCard.first {
                    self.updateModel(existingIndex: existingIndex, currentIndex: index)
                }
            }
        } else {
            // first time
            self.flippedCard.removeAll()
            self.flippedCard.append(index)
            
            var currentViewModel = self.cardData[index]
            currentViewModel.faceUp = true
            var data = self.cardData
            data[index] = currentViewModel
            self.cardData = data
        }
    }
    
    func updateModel(existingIndex: Int, currentIndex: Int ) {
        self.flippedCard.removeAll()
        self.flippedCard.append(currentIndex)
        
        var existingModel = self.cardData[existingIndex]
        existingModel.faceUp = false
        
        var currentViewModel = self.cardData[currentIndex]
        currentViewModel.faceUp = true
    
        var data = self.cardData
        data[currentIndex] = currentViewModel
        data[existingIndex] = existingModel
        self.cardData = data
    }
    
    func startGame() {
        // set up Game with local images
        var cards = [Int]()
        for i in 0..<pairCards {
            cards.append(i)
            cards.append(i)
        }
        if pairCards * 2 < totalCard {
            cards.append(pairCards)
        }
        cards.shuffle()
        
        var viewModel = [GameImageViewModel]()
        for i in 0..<cards.count {
            let imageNumber = cards[i]
            let name = "animals_\(imageNumber)"
            if let matchingIndex = cards.lastIndex(of: imageNumber) {
                let model = GameImageViewModel(imageName: name, isMatched: false, faceUp: false, matchingIndex: matchingIndex)
                viewModel.append(model)
            }
        }
        cardData = viewModel
        cardIndex = cards
        matchedPairs = cards
        flippedCard = []
    }
}
