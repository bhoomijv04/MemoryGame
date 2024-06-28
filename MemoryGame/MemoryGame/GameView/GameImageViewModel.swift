//
//  GameImageViewModel.swift
//  MemoryGame
//
//  Created by Bhoomi Vadgama on 23/06/24.
//

import Foundation
import UIKit
import MapKit
import MessageUI

public struct GameImageViewModel {
    
    public var imageName: String = ""
    public var isMatched: Bool
    public var faceUp: Bool
    public var id: UUID
    public var matchingIndex: Int
    
    init(imageName: String, isMatched: Bool, faceUp: Bool, id: UUID = UUID(), matchingIndex: Int) {
        self.imageName = imageName
        self.isMatched = isMatched
        self.faceUp = faceUp
        self.id = id
        self.matchingIndex = matchingIndex
    }
    
    
    
    /**
     
     16 elements
       - 0 : 2
       - 1 : 3
       - 2 : 7
       - 3 : 7
       - 4 : 6
       - 5 : 4
       - 6 : 3
       - 7 : 6
       - 8 : 0
       - 9 : 2
       - 10 : 5
       - 11 : 0
       - 12 : 4
       - 13 : 5
       - 14 : 1
       - 15 : 1
     
     
     5 images
     { image: "",  id : 1}
     
     5/2 = 2.5 >>> 2 pairs
      imagedata = 10 images
        
     pairedimages =  test[0..< 2]
     remainingmages =  test[pairedImages.count < ... imageData]
      
     let array matchedPairs = []
     
     for i < count {
     if let image = pairedImagwe[i] {
        images [i] = image
        images [i+1] = image
        matchedPairs.append(i)
        matchedPairs.append(i)
     } else {
      images[i] = remainingmages[i]
     }
     
     let shuffled = images.shuffle
     
     for i in count = 5 {
        GameImageViewModel(imageName: "animals_0", isMatched: false, faceUp: false, matchedIndex: i)
     }
     
        
     
     GameImageViewModel(imageName: "animals_0", isMatched: false, faceUp: false, index: 0),
     GameImageViewModel(imageName: "animals_1", isMatched: false, faceUp: false, index: 1),
     GameImageViewModel(imageName: "animals_0", isMatched: false, faceUp: false, index: 0),
     GameImageViewModel(imageName: "animals_1", isMatched: false, faceUp: false, index: 1),
     GameImageViewModel(imageName: "animals_2", isMatched: false, faceUp: false, index: 2),
     GameImageViewModel(imageName: "animals_2", isMatched: false, faceUp: false, index: 2)
     
        matched {
        currentviewmodel.index === flippedCard.viewmodel2.index
     } else {
        not matched and remove flipped card.
     }
     }
     
     
     flippedCard = [
     GameImageViewModel(imageName: "animals_0", isMatched: false, faceUp: true, index: 0)
     ]
     */
}

struct image {
    public let id: Int
    public let imageName: String
}

