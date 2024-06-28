//
//  GameViewCoordinator.swift
//  MemoryGame
//
//  Created by Bhoomi Vadgama on 23/06/24.
//

import Foundation
import SwiftUI

final class GameViewCoordinator: SwiftUIEnqueueCoordinator {
    
    typealias EnqueueContextType = GameViewModel.RouteType
    
    weak var rootHostingController: UIHostingController<GameView>?
    
    // MARK: Intitate SchoolListView
    func instantiateView() -> UIViewController {
        let viewModel = GameViewModel(coordinator: self)
        let rootView = GameView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: rootView)
        self.rootHostingController = viewController
        return viewController
    }
    
    // MARK: Navigation route from SchoolListView
    func enqueueRoute(with context: GameViewModel.RouteType, animated: Bool, completion: ((Bool) -> Void)?) -> AnyView? {
        // Any root we need to follow
        return nil
    }
}
