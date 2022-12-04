//: [Previous](@previous)

import Foundation

// Convert input to 2 arrays of 2 integers
// e.g. ["91-93,6-92"] -> [[91,93],[6,92]]
// Drop the last because the input is stupid and has an empty line at the end
let input = readInputArray()
    .compactMap({$0
        .split(separator: ",")
        .compactMap({$0
            .split(separator: "-")
            .compactMap({Int($0)})
        })
    }).dropLast()

func part1() {
    var count = 0
    for i in input {
        if Set(i[0][0]...i[0][1]).isSubset(of: Set(i[1][0]...i[1][1])) ||
            Set(i[0][0]...i[0][1]).isSuperset(of: Set(i[1][0]...i[1][1])) {
            count += 1
        }
    }
    print(count)
}

func part2() {
    var count = 0
    for i in input {
        if Set(i[0][0]...i[0][1]).intersection(Set(i[1][0]...i[1][1])).count > 0 {
            count += 1
        }
    }
    print(count)
}

part1()
part2()

//: [Next](@next)
