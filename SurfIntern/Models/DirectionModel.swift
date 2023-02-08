//
//  DirectionModel.swift
//  SurfIntern
//
//  Created by Valery Keplin on 8.02.23.
//

import Foundation

enum Condition {
    case notSelected
    case selected
}

struct DirectionModel {
    let direction: String
    var condition: Condition
}

var directions: [DirectionModel] = [
    DirectionModel(direction: "IOS", condition: Condition.notSelected),
    DirectionModel(direction: "Android", condition: Condition.notSelected),
    DirectionModel(direction: "Design", condition: Condition.notSelected),
    DirectionModel(direction: "Flutter", condition: Condition.notSelected),
    DirectionModel(direction: "QA", condition: Condition.notSelected),
    DirectionModel(direction: "PM", condition: Condition.notSelected),
    DirectionModel(direction: "Хочу", condition: Condition.notSelected),
    DirectionModel(direction: "стажироваться", condition: Condition.notSelected),
    DirectionModel(direction: "у", condition: Condition.notSelected),
    DirectionModel(direction: "вас", condition: Condition.notSelected),
]
