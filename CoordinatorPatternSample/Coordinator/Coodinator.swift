//
//  Coodinator.swift
//  CoordinatorPatternSample
//
//  Created by jiwon Yoon on 2023/07/17.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
