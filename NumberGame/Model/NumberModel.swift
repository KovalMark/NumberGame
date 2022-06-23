//
//  NumberModel.swift
//  NumberGame
//
//  Created by Марк Коваль on 21/06/2022.
//

import UIKit

//MARK: NumberModel
struct NumberModel {
    var enterNumber: Int = 0
    var userNumber: Int  = 0
    var systemNumber: Int = Int.random(in: 1...100)
}
