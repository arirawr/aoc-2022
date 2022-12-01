//: [Previous](@previous)

import Foundation

let input = readInput().map({ Int($0) })

func part1() {
    var sum = 0
    var highestSum = 0

    for i in input {
        if i != nil {
            sum += i!
        }
        // If nil, we have an empty line and should reset the sum
        else {
            if sum > highestSum {
                highestSum = sum
            }
            sum = 0
        }
    }

    print(highestSum)
}

func part2() {
    var sum = 0
    var highestSums = [Int]()

    for i in input {
        if i != nil {
            sum += i!
        }
        // If nil, we have an empty line and should reset the sum
        else {
            highestSums.append(sum)
            sum = 0
        }
    }
    
    // Sort by value (ascending)
    highestSums.sort()

    // Sum of the 3 highest values
    print(highestSums.suffix(3).reduce(0,+))
}

part1()
part2()


//: [Next](@next)
