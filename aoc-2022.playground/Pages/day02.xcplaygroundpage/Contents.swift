//: [Previous](@previous)

import Foundation

let input = readInputArray()

enum Shape: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

enum Result: Int {
    case win = 6
    case draw = 3
    case lose = 0
}

func part1() {
    let rounds = input.compactMap({$0.split(separator: " ").compactMap({getShape(code: String($0))})})
    print(rounds)

    var score = 0
    for i in rounds {
        if i.count > 0 {
            score += i[1].rawValue
            score += resolveRound(a: i[0], b: i[1])
        }
    }

    print(score)
}

func part2() {
    let rounds = input.compactMap({$0.split(separator: " ")})
    
    var score = 0
    
    for round in rounds {
        var opponent: Shape
        var result: Result
        
        if round.count == 2 {
            opponent = getShape(code: String(round[0]))
            result = getResult(code: String(round[1]))
            
            score += result.rawValue
            score += play(opponent: opponent, result: result).rawValue
        }
    }
    
    print(score)
}
part2()

func play(opponent: Shape, result: Result) -> Shape {
    switch opponent {
        case .rock:
            switch result {
                case .win: return .paper
                case .draw: return .rock
                case .lose: return .scissors
            }
        case .paper:
            switch result {
                case .win: return .scissors
                case .draw: return .paper
                case .lose: return .rock
            }
        case .scissors:
            switch result {
                case .win: return .rock
                case .draw: return .scissors
                case .lose: return .paper
            }
    }
}

func getShape(code: String) -> Shape {
    if(code == "A" || code == "X") {
        return .rock
    }
    if(code == "B" || code == "Y") {
        return .paper
    }
    if(code == "C" || code == "Z") {
        return .scissors
    }
    return .rock
}

func getResult(code: String) -> Result {
    if(code == "X") {
        return .lose
    }
    if(code == "Y") {
        return .draw
    }
    if(code == "Z") {
        return .win
    }
    return .lose
}

func resolveRound(a: Shape, b: Shape) -> Int {
//    if a == b {
//        return 3
//    }
    switch a {
        case .rock:
            switch b {
                case .paper: return 6
                case .scissors: return 0
                case .rock: return 3
            }
        case .paper:
            switch b {
                case .paper: return 3
                case .scissors: return 6
                case .rock: return 0
            }
        case .scissors:
            switch b {
                case .paper: return 0
                case .scissors: return 3
                case .rock: return 6
            }
    }
}


//: [Next](@next)
