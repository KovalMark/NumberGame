//
//  UserNumberController.swift
//  NumberGame
//
//  Created by Марк Коваль on 21/06/2022.
//

import UIKit

//MARK: UserNumberController
class UserNumberController: UIViewController {
    
    var numberTextField = NumberTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.hideKeyboard()
    }

    //MARK: Views
    private let enterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.4980180264, green: 0.4980559349, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Enter the Number", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func pressButton() {
        if let text = numberTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            let trySystemController = TrySystemController()
            trySystemController.numberModel.userNumber = number
            trySystemController.modalPresentationStyle = .fullScreen
            self.present(trySystemController, animated: true, completion: nil)
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
        view.addSubview(numberTextField)
        numberTextField.addTarget(self, action: #selector(changeText), for: .editingChanged)
        view.addSubview(enterButton)
    }
}

//MARK: extension setupConstraints
extension UserNumberController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            numberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            enterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
