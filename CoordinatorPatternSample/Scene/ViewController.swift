//
//  ViewController.swift
//  CoordinatorPatternSample
//
//  Created by jiwon Yoon on 2023/07/17.
//

import UIKit

class ViewController: UIViewController{
    
    weak var coordinator: MainCoordinator?
    
    private lazy var targetLabel: UILabel = {
        let label = UILabel()
        label.text = "Target"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var displayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 4.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        [
            targetLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            targetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: offset),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset),
            targetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -offset),
            targetLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -offset)
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["default", "bold", "light"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(didChangeSegmentValue), for: .valueChanged)
        
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentControl
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(buyTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("CreateAccount", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [
            displayView,
            segmentControl,
            buyButton,
            createAccountButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        NSLayoutConstraint.activate([
            displayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            displayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset),
            displayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -offset)
        ])
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 32.0),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 32.0),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 32.0),
            createAccountButton.leadingAnchor.constraint(equalTo: buyButton.trailingAnchor, constant: 16.0),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
        ])
    }
    
    @objc
    func didChangeSegmentValue(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("default")
            targetLabel.font = .systemFont(ofSize: 30)
        case 1:
            print("bold")
            targetLabel.font = .systemFont(ofSize: 30, weight: .bold)
        case 2:
            print("light")
            targetLabel.font = .systemFont(ofSize: 30, weight: .light)
        default:
            break
        }
    }
    
    @objc
    func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @objc
    func createAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
}

