//
//  GameImageView.swift
//  MemoryGame
//
//  Created by Bhoomi Vadgama on 23/06/24.
//

import Foundation
import SwiftUI

public struct GameImageView: View {
    
    public var imageViewModel: GameImageViewModel
    
    init(imageViewModel: GameImageViewModel) {
        self.imageViewModel = imageViewModel
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16).fill(Color.white)
            RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 3)
            
            if imageViewModel.faceUp {
                Image(imageViewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .padding(4)
                    .frame(width: 100, height: 150)
            } else {
                RoundedRectangle(cornerRadius: 16).fill(Color.gray)
                .frame(width: 100, height: 150)
            }
        }
        .shadow(radius: 5)
        .rotation3DEffect(imageViewModel.faceUp ? Angle(degrees: 0) : Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
        .opacity(imageViewModel.isMatched ? 0 : 1)
        .padding(5)
    }
}
