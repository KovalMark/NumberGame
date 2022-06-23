//
//  TryUserController.swift
//  NumberGame
//
//  Created by Марк Коваль on 21/06/2022.
//

import UIKit

//MARK: TryUserController
class TryUserController: UIViewController {
    
    var numberTextField = NumberTextField()
    var numberModel = NumberModel()
    var counter = 0
    var compCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.hideKeyboard()
    }
    
    //MARK: Views
    private let tryLabel: UILabel = {
        
        let label = UILabel()
        var counter = 1
        label.text = "Try № \(counter)"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let userLabel: UILabel = {
        
        let label = UILabel()
        label.text = "You are guessing"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let resultLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: enterButton
    private let enterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.4980180264, green: 0.4980559349, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Guess", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func pressButton() {
        if let text = numberTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            numberModel.enterNumber = number
            checkResult(myNumber: numberModel.enterNumber)
            counter += 1
            tryLabel.text = "Try № \(counter)"
        }
    }
    
    func checkResult(myNumber: Int) {
        if myNumber == numberModel.systemNumber {
            resultLabel.isHidden = true
            counter += 1
            
            let resultController = ResultController()
            resultController.userCount = counter
            resultController.systemCount = compCounter
            
            resultController.modalPresentationStyle = .fullScreen
            self.present(resultController, animated: true, completion: nil)
            
        } else if myNumber > numberModel.systemNumber {
            resultLabel.text = "No, my number is less than yours"
        } else if myNumber < numberModel.systemNumber {
            resultLabel.text = "No, my number is more than yours"
        }
    }
    
    @objc func changeText() {
        if let number = numberTextField.text?.count {
            if number > 0 {
                enterButton.backgroundColor = #colorLiteral(red: 0, green: 0.0002509109036, blue: 0.9971507192, alpha: 1)
                enterButton.isEnabled = true
            } else {
                enterButton.backgroundColor = #colorLiteral(red: 0.4980180264, green: 0.4980559349, blue: 1, alpha: 1)
                enterButton.isEnabled = false
            }
        }
    }
    
    //MARK: setupView
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(tryLabel)
        view.addSubview(userLabel)
        view.addSubview(numberTextField)
        numberTextField.addTarget(self, action: #selector(changeText), for: .editingChanged)
        view.addSubview(enterButton)
        view.addSubview(resultLabel)
    }
}

//MARK: extension setupConstraints
extension TryUserController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 25),
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            numberTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 50),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 50),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 50),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
