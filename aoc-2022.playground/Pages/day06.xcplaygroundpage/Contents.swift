//: [Previous](@previous)

import Foundation

let input = Array(readInputRaw())

var lastFour = [String]()
var index = 0

func solve(_ length: Int) -> Int {
    for char in input {
        index += 1
        lastFour.append(String(char))
        
        if lastFour.count > length {
            lastFour.removeFirst()
            if lastFour.count == Set(lastFour).count {
                return index
            }
        }
    }
    return 0
}

print("Part 1: " + String(solve(4)))
print("Part 2: " + String(solve(14)))

//: [Next](@next)
