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

struct Direction {
    let direction: String
    var condition: Condition
}

final class DirectionModel {
    
    static let shared = DirectionModel()
    
    var directions: [Direction] = [
        Direction(direction: "IOS", condition: Condition.notSelected),
        Direction(direction: "Android", condition: Condition.notSelected),
        Direction(direction: "Design", condition: Condition.notSelected),
        Direction(direction: "Flutter", condition: Condition.notSelected),
        Direction(direction: "QA", condition: Condition.notSelected),
        Direction(direction: "PM", condition: Condition.notSelected),
        Direction(direction: "Хочу", condition: Condition.notSelected),
        Direction(direction: "стажироваться", condition: Condition.notSelected),
        Direction(direction: "у", condition: Condition.notSelected),
        Direction(direction: "вас", condition: Condition.notSelected),
    ]
    
    func redefineDirections(index: Int) {
        if index >= 0 {
            directions[index].condition = .selected
            let direction = directions.remove(at: index)
            directions.insert(direction, at: 0)
        }
        
        for i in 1..<directions.count {
            self.directions[i].condition = Condition.notSelected
        }
    }
}






