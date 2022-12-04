//: [Previous](@previous)

import Foundation

let input = readInputArray()
    .compactMap({$0
        .split(separator: ",")
        .compactMap({$0
            .split(separator: "-")
            .compactMap({Int($0)})
        })
    })
print(input)

func part1() {
    var count = 0
    for i in input {
        if i.count == 2 {
            if Set(i[0][0]...i[0][1]).isSubset(of: Set(i[1][0]...i[1][1])) || Set(i[0][0]...i[0][1]).isSuperset(of: Set(i[1][0]...i[1][1])) {
                count += 1
            }
            
        }
    }
    print(count)
}

func part2() {
    var count = 0
    for i in input {
        if i.count == 2 {
            if Set(i[0][0]...i[0][1]).intersection(Set(i[1][0]...i[1][1])).count > 0 {
                count += 1
            }
            
        }
    }
    print(count)
}

//: [Next](@next)
