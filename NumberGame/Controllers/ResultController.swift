//
//  ResultController.swift
//  NumberGame
//
//  Created by Марк Коваль on 22/06/2022.
//

import UIKit

//MARK: ResultController
class ResultController: UIViewController {
    
    var userCount: Int = 0
    var systemCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    //MARK: Views
    private let scoresLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Scores:"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let userLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Your's tries count:"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let systemLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Computer's tries count:"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let winnerLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: mainButton
    private let mainButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.0002509109036, blue: 0.9971507192, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Main menu", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func pressButton() {
        let startController = StartController()
        startController.modalPresentationStyle = .fullScreen
        self.present(startController, animated: true, completion: nil)
    }
    
    func winner() {
        if userCount > systemCount {
            winnerLabel.text = "Computer win"
        } else if userCount < systemCount {
            winnerLabel.text = "You win"
        } else {
            winnerLabel.text = "Draw"
        }
    }
    
    //MARK: setupView
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(scoresLabel)
        view.addSubview(userLabel)
        userLabel.text = "Your's tries count: \(userCount)"
        view.addSubview(systemLabel)
        systemLabel.text = "Computer's tries count: \(systemCount)"
        view.addSubview(winnerLabel)
        winner()
        view.addSubview(mainButton)
    }
}

//MARK: extension setupConstraints
extension ResultController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scoresLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scoresLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: scoresLabel.bottomAnchor, constant: 50),
            userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            systemLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 25),
            systemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            systemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            mainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            mainButton.heightAnchor.constraint(equalToConstant: 40),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            winnerLabel.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -25),
            winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
