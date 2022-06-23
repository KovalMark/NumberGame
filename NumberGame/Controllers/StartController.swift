//
//  StartViewController.swift
//  NumberGame
//
//  Created by Марк Коваль on 21/06/2022.
//

import UIKit

//MARK: StartController
class StartController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    //MARK: Views
    private let startLabel: UILabel = {
        
        let label = UILabel()
        label.text = "My Awesome Game"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let startButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.0002509109036, blue: 0.9971507192, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Start New Game", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func pressButton() {
        let userNumberController = UserNumberController()
        userNumberController.modalPresentationStyle = .fullScreen
        self.present(userNumberController, animated: true, completion: nil)
    }
    
    //MARK: setupView
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(startLabel)
        view.addSubview(startButton)
    }
}

//MARK: extension setupConstraints
extension StartController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            startLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
