//: [Previous](@previous)

import Foundation

let input = readInputArray().compactMap {
    Array($0).compactMap { Int(String($0)) }
}.dropLast()
    
//func matrixTranspose<T>(_ matrix: [[T]]) -> [[T]] {
//    if matrix.isEmpty {return matrix}
//    var result = [[T]]()
//    for index in 0..<matrix.first!.count {
//        result.append(matrix.map{$0[index]})
//    }
//    return result
//}

func isVisible(_ row: Int, _ col: Int) -> Bool {
    let tree = input[row][col]
    
    if row == 0 || col == 0 || row == input.count-1 || col == input[0].count-1 {
        return true
    }
    
    if input[..<row].filter({ $0[col] >= tree }).count == 0 { return true }
    if input[(row + 1)...].filter({ $0[col] >= tree }).count == 0 { return true }
    if input[row][..<col].filter({ $0 >= tree }).count == 0 { return true }
    if input[row][(col + 1)...].filter({ $0 >= tree }).count == 0 { return true }
    return false
}

func getScore(_ row: Int, _ col: Int) -> Int {
    if row == 0 || col == 0 || row == input.count-1 || col == input[0].count-1 {
        return 0
    }
    let tree = input[row][col]
    var countTop = 1, countBottom = 1, countLeft = 1, countRight = 1
    
    var trees: [[Int]], line: [Int]
    trees = input[..<row].reversed()
    trees.removeLast()
    for t in trees {
        if t[col] < tree {
            countTop += 1
        }
        else { break }
    }
    
    trees = Array(input[(row+1)...])
    trees.removeLast()
    for t in trees {
        if t[col] < tree {
            countBottom += 1
        }
        else { break }
    }
    
    line = input[row][..<col].reversed()
    line.removeLast()
    for t in line {
        if t < tree {
            countLeft += 1
        }
        else { break }
    }
    
    line = Array(input[row][(col+1)...])
    line.removeLast()
    for t in line {
        if t < tree {
            countRight += 1
        }
        else { break }
    }
    return countTop * countBottom * countLeft * countRight
}

func part1() {
    var visible = 0
    for row in 0..<input.count {
        for col in 0..<input[row].count {
            if isVisible(row,col) == true { visible += 1 }
        }
    }
    print(visible)
}

func part2() {
    var bestScenery = 0
    for row in 0..<input.count {
        for col in 0..<input[row].count {
            let treeScore = getScore(row,col)
            if treeScore > bestScenery  {
                bestScenery = treeScore
            }
        }
    }
    print(bestScenery)
}

part1()
part2()

//: [Next](@next)
