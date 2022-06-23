//
//  TrySystemController.swift
//  NumberGame
//
//  Created by Марк Коваль on 21/06/2022.
//

import UIKit

//MARK: TrySystemController
class TrySystemController: UIViewController {
    
    var numberModel = NumberModel()
    var min: Int = 0
    var max: Int = 100
    var mid: Int = 0
    var compCounter: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.hideKeyboard()
    }
    
    //MARK: Views
    private let tryLabel: UILabel = {
        
        let label = UILabel()
        var compCounter = 1
        label.text = "Try № \(compCounter)"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let computerLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Computer is guessing"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let numberLabel: UILabel = {
        
        let label = UILabel()
        var min: Int = 0
        var max: Int = 100
        var mid: Int = 0
        mid = (min + max) / 2
        label.text = "Your number is - \(mid) ?"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let myNumberIsLabel: UILabel = {
        
        let label = UILabel()
        label.text = "My number is ..."
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: moreButton
    private let moreButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle(">", for: .normal)
        button.addTarget(self, action: #selector(morePressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func morePressButton() {
        if numberModel.userNumber > mid {
            min = mid
            mid = (min + max) / 2
            numberLabel.text = "Your number is - \(mid) ?"
            compCounter += 1
            tryLabel.text = "Try № \(compCounter)"
        }
    }
    
    //MARK: equallyButton
    private let equallyButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("=", for: .normal)
        button.addTarget(self, action: #selector(equalPressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func equalPressButton() {
        if numberModel.userNumber == mid {
            equallyButton.isEnabled = true
            let userNumberController = TryUserController()
            userNumberController.compCounter = compCounter
            userNumberController.modalPresentationStyle = .fullScreen
            self.present(userNumberController, animated: true, completion: nil)
        }
    }
    
    //MARK: lessButton
    private let lessButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("<", for: .normal)
        button.addTarget(self, action: #selector(lessPressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func lessPressButton() {
        if numberModel.userNumber < mid {
            max = mid
            mid = (min + max) / 2
            numberLabel.text = "Your number is - \(mid) ?"
            compCounter += 1
            tryLabel.text = "Try № \(compCounter)"
        }
    }
    
    //MARK: setupView
    private func setupView() {
        compCounter = 1
        mid = (min + max) / 2
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(tryLabel)
        view.addSubview(computerLabel)
        view.addSubview(numberLabel)
        view.addSubview(myNumberIsLabel)
        view.addSubview(moreButton)
        view.addSubview(equallyButton)
        view.addSubview(lessButton)
    }
}

//MARK: extension setupConstraints
extension TrySystemController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            computerLabel.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 25),
            computerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: computerLabel.bottomAnchor, constant: 50),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            equallyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            equallyButton.heightAnchor.constraint(equalToConstant: 50),
            equallyButton.widthAnchor.constraint(equalToConstant: 50),
            equallyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            moreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            moreButton.heightAnchor.constraint(equalToConstant: 50),
            moreButton.widthAnchor.constraint(equalToConstant: 50),
            moreButton.trailingAnchor.constraint(equalTo: equallyButton.leadingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            lessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            lessButton.leadingAnchor.constraint(equalTo: equallyButton.trailingAnchor, constant: 25),
            lessButton.heightAnchor.constraint(equalToConstant: 50),
            lessButton.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            myNumberIsLabel.bottomAnchor.constraint(equalTo: lessButton.topAnchor, constant: -20),
            myNumberIsLabel.leadingAnchor.constraint(equalTo: equallyButton.leadingAnchor, constant: -75)
        ])
    }
}
