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
    let label: String
    var condition: Condition
}

final class DirectionModel {
    
    // MARK: - Properties
    
    var directionsForFirstCollection: [Direction] = [
        Direction(label: "IOS", condition: Condition.notSelected),
        Direction(label: "Android", condition: Condition.notSelected),
        Direction(label: "Design", condition: Condition.notSelected),
        Direction(label: "Flutter", condition: Condition.notSelected),
        Direction(label: "QA", condition: Condition.notSelected),
        Direction(label: "PM", condition: Condition.notSelected),
        Direction(label: "I would", condition: Condition.notSelected),
        Direction(label: "like", condition: Condition.notSelected),
        Direction(label: "to intern", condition: Condition.notSelected),
        Direction(label: "with you", condition: Condition.notSelected),
    ]
    
    var directionsForSecondCollection: [Direction] = [
        Direction(label: "IOS", condition: Condition.notSelected),
        Direction(label: "Android", condition: Condition.notSelected),
        Direction(label: "Design", condition: Condition.notSelected),
        Direction(label: "Flutter", condition: Condition.notSelected),
        Direction(label: "QA", condition: Condition.notSelected),
        Direction(label: "PM", condition: Condition.notSelected),
        Direction(label: "I would", condition: Condition.notSelected),
        Direction(label: "like", condition: Condition.notSelected),
        Direction(label: "to intern", condition: Condition.notSelected),
        Direction(label: "with you", condition: Condition.notSelected),
    ]
    
    // MARK: - Methods
    
    func checkDirectionsForFirstCollection(index: Int) {
        let index = index
        
        switch directionsForFirstCollection[index].condition {
        case .selected:
            directionsForFirstCollection[index].condition = .notSelected
        default:
            redefineDirectionsForFirstCollection(index: index)
        }
    }
    
    func checkDirectionsForSecondCollection(index: Int) {
        let index = index
        
        switch directionsForSecondCollection[index].condition {
        case .selected:
            directionsForSecondCollection[index].condition = .notSelected
        default:
            directionsForSecondCollection[index].condition = .selected
            redefineDirectionsForSecondCollection(index: index)
        }
    }
    
    private func redefineDirectionsForFirstCollection(index: Int) {
        if index >= 0 {
            directionsForFirstCollection[index].condition = .selected
            let direction = directionsForFirstCollection.remove(at: index)
            directionsForFirstCollection.insert(direction, at: 0)
        }
        
        for i in 1..<directionsForFirstCollection.count {
            self.directionsForFirstCollection[i].condition = Condition.notSelected
        }
    }
    
    private func redefineDirectionsForSecondCollection(index: Int) {
        for i in 0..<directionsForSecondCollection.count {
            if i != index {
                self.directionsForSecondCollection[i].condition = Condition.notSelected
            }
        }
    }
}
