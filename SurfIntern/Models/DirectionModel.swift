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
    var label: Condition
}

final class DirectionModel {
    
    // MARK: - Properties
    
    var directionsForFirstCollection: [Direction] = [
        Direction(direction: "IOS", label: Condition.notSelected),
        Direction(direction: "Android", label: Condition.notSelected),
        Direction(direction: "Design", label: Condition.notSelected),
        Direction(direction: "Flutter", label: Condition.notSelected),
        Direction(direction: "QA", label: Condition.notSelected),
        Direction(direction: "PM", label: Condition.notSelected),
        Direction(direction: "I would", label: Condition.notSelected),
        Direction(direction: "like", label: Condition.notSelected),
        Direction(direction: "to intern", label: Condition.notSelected),
        Direction(direction: "with you", label: Condition.notSelected),
    ]
    
    var directionsForSecondCollection: [Direction] = [
        Direction(direction: "IOS", label: Condition.notSelected),
        Direction(direction: "Android", label: Condition.notSelected),
        Direction(direction: "Design", label: Condition.notSelected),
        Direction(direction: "Flutter", label: Condition.notSelected),
        Direction(direction: "QA", label: Condition.notSelected),
        Direction(direction: "PM", label: Condition.notSelected),
        Direction(direction: "I would", label: Condition.notSelected),
        Direction(direction: "like", label: Condition.notSelected),
        Direction(direction: "to intern", label: Condition.notSelected),
        Direction(direction: "with you", label: Condition.notSelected),
    ]
    
    // MARK: - Methods
    
    func checkDirectionsForFirstCollection(index: Int) {
        let index = index
        
        switch directionsForFirstCollection[index].label {
        case .selected:
            directionsForFirstCollection[index].label = .notSelected
        default:
            redefineDirectionsForFirstCollection(index: index)
        }
    }
    
    func checkDirectionsForSecondCollection(index: Int) {
        let index = index
        
        switch directionsForSecondCollection[index].label {
        case .selected:
            directionsForSecondCollection[index].label = .notSelected
        default:
            directionsForSecondCollection[index].label = .selected
            redefineDirectionsForSecondCollection(index: index)
        }
    }
    
    private func redefineDirectionsForFirstCollection(index: Int) {
        if index >= 0 {
            directionsForFirstCollection[index].label = .selected
            let direction = directionsForFirstCollection.remove(at: index)
            directionsForFirstCollection.insert(direction, at: 0)
        }
        
        for i in 1..<directionsForFirstCollection.count {
            self.directionsForFirstCollection[i].label = Condition.notSelected
        }
    }
    
    private func redefineDirectionsForSecondCollection(index: Int) {
        for i in 0..<directionsForSecondCollection.count {
            if i != index {
                self.directionsForSecondCollection[i].label = Condition.notSelected
            }
        }
    }
}
