//
//  DirectionModel.swift
//  SurfIntern
//
//  Created by Valery Keplin on 8.02.23.
//

enum Condition {
    case notSelected
    case selected
}

struct Direction {
    let direction: String
    var condition: Condition
}

final class DirectionModel {
    
    var directions: [Direction] = [
        Direction(direction: "IOS", condition: Condition.notSelected),
        Direction(direction: "Android", condition: Condition.notSelected),
        Direction(direction: "Design", condition: Condition.notSelected),
        Direction(direction: "Flutter", condition: Condition.notSelected),
        Direction(direction: "QA", condition: Condition.notSelected),
        Direction(direction: "PM", condition: Condition.notSelected),
        Direction(direction: "I would", condition: Condition.notSelected),
        Direction(direction: "like", condition: Condition.notSelected),
        Direction(direction: "to intern", condition: Condition.notSelected),
        Direction(direction: "with you", condition: Condition.notSelected),
    ]
    
    func checkDirections(index: Int) {
        let index = index
        
        switch directions[index].condition {
        case .selected:
            directions[index].condition = .notSelected
        default:
            redefineDirections(index: index)
        }
    }
    
    private func redefineDirections(index: Int) {
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
