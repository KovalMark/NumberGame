//
//  NumberTextField.swift
//  NumberGame
//
//  Created by Марк Коваль on 22/06/2022.
//

import UIKit

//MARK: NumberTextField
class NumberTextField: UITextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setupView
    private func setupView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        returnKeyType = .done
        textAlignment = .center
        placeholder = "Guess the number"
        keyboardType = .numberPad
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: range textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let minValue = 1
        let maxValue = 100
        lazy var valuesRange = minValue...maxValue
        let newText = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if newText.isEmpty {
            return true
        }
        
        return valuesRange.contains(Int(newText) ?? minValue - 1)
    }
}
