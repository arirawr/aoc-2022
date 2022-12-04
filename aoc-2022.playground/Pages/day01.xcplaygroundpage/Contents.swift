//: [Previous](@previous)

import Foundation

let input = readInputRaw()

func part1() {
    print(input
        .components(separatedBy: "\n\n")
        .map({ $0
            .split(separator: "\n")
            .map( {Int($0)!} )
        .reduce(0,+) })
        .sorted()
        .suffix(1))
}

func part2() {
    print(input
        .components(separatedBy: "\n\n")
        .map({ $0
            .split(separator: "\n")
            .map( {Int($0)!} )
            .reduce(0,+) })
        .sorted()
        .suffix(3)
        .reduce(0,+))
}

part1()
part2()

//: [Next](@next)
