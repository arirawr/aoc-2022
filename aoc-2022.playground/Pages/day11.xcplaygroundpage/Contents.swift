//: [Previous](@previous)

import Foundation

enum Operation: String {
    case add = "+"
    case multiply = "*"
}

struct Monkey {
    var items: [Int]
    var operation: (Operation,Int?)
    var test: Int
    var throwTo: (Int,Int)
    
    init(items: [Int], operation: (Operation,Int?), test: Int, throwTo: (Int,Int)) {
        self.items = items
        self.operation = operation
        self.test = test
        self.throwTo = throwTo
    }
}

// Convert input to format:
// ["77, 69, 76, 77, 50, 58", "new = old * 11", "divisible by 5", "throw to monkey 1"]
var input = readInputRaw().components(separatedBy: "\n\n")
    .map({$0
        .components(separatedBy: "\n")
        .dropFirst()
    })
// Remove the stubborn empty line
input[input.count-1].removeLast()

let data = input.map { $0.map { $0.components(separatedBy: ": ")[1] } }

// Parse to format:
// { [77, 69, 76, 77, 50, 58], (.multiply, Optional(11)), 5, (1,0) }
func parseData() -> [Monkey] {
    return data.map({
        Monkey(
            items: $0[0].components(separatedBy: ", ").map({Int($0)!}),
            operation: (Operation(rawValue: $0[1].components(separatedBy: " ")[3])!, Int($0[1].components(separatedBy: " ")[4])),
            test: Int($0[2].components(separatedBy: " ")[2])!,
            throwTo: (Int($0[3].components(separatedBy: " ")[3])!, Int($0[4].components(separatedBy: " ")[3])!)
        )
    })
}

func solve(_ rounds: Int, _ divideWorry: Bool) {
    var monkeys = parseData()
    var worry = 0
    var inspected = [0,0,0,0,0,0,0,0]
    let modulus = monkeys.map { $0.test }.reduce(1, *)

    for _ in 0..<rounds {
        for i in 0..<monkeys.count {
            for item in monkeys[i].items {
                inspected[i] += 1
                worry = item
                
                var value = (monkeys[i].operation.1 != nil) ? monkeys[i].operation.1! : worry
                switch monkeys[i].operation.0 {
                    case .multiply: worry = worry * value
                    case .add: worry = worry + value
                }
                
                if(divideWorry) { worry = Int(floor(Double(worry)/3)) }
                worry = worry % modulus
                
                let next = worry.isMultiple(of: monkeys[i].test) ? monkeys[i].throwTo.0 : monkeys[i].throwTo.1
                monkeys[next].items.append(worry)
            }
            monkeys[i].items = []
        }
    }
    print(inspected.sorted().reversed()[0] * inspected.sorted().reversed()[1])
}

func part1() { solve(20, true) }
func part2() { solve(10000, false) }

part1(); part2()

//: [Next](@next)
