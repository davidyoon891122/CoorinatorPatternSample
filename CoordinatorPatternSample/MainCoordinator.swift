//
//  MainCoordinator.swift
//  CoordinatorPatternSample
//
//  Created by jiwon Yoon on 2023/07/17.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
