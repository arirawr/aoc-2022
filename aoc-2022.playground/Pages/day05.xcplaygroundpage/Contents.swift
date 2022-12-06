//: [Previous](@previous)

import Foundation

// Parse only the instructions - I don't have time for the stacks
let input = readInputRaw()
    .components(separatedBy: "\n\n")[1]
    .components(separatedBy: "\n")
    .dropLast()

var stacks = ["", "GTRW", "GCHPMSVW", "CLTSGM", "JHDMWRF", "PQLHSWFJ", "PJDNFMS", "ZBDFGCSJ", "RTB", "HNWLC"].map({Array($0)})

// Extract the numbers from the instructions
let instructions = input
    .compactMap({$0.split(separator: " ")})
    .map({[Int($0[1])!,Int($0[3])!,Int($0[5])!]})
   
func part1() {
    for i in instructions {
        let quantity = i[0]
        let start = i[1]
        let end = i[2]
        
        for _ in 1...quantity {
            stacks[end].append(stacks[start].popLast()!)
        }
    }
}

func part2() {
    for i in instructions {
        let quantity = i[0]
        let start = i[1]
        let end = i[2]
        
        stacks[end].append(contentsOf: stacks[start].suffix(quantity))
        stacks[start].removeLast(quantity)
    }
}

print(stacks.dropFirst().map({$0.last}))

//: [Next](@next)
