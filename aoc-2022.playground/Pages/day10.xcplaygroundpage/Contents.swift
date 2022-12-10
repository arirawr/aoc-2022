//: [Previous](@previous)

import Foundation

let input = readInputArray().compactMap({$0.components(separatedBy:" ")})

var x = 1
var cycle = 0
var sum = 0

func checkSum() {
    if Set([20,60,100,140,180,220]).contains(cycle) {
        sum += (x * cycle)
    }
}

func part1() {
    for i in input {
        cycle += 1
        checkSum()
        if i.count == 2 {
            cycle += 1
            checkSum()
            x += Int(i[1])!
        }
    }
    print(sum)
}

func part2() {
    var output = ""

    for i in input {
        let cycles = (i.count == 2) ? 2 : 1
        
        for _ in 0..<cycles {
            if Set([x-1, x, x+1]).contains(output.count) {
                output += "*"
            }
            else { output += " " }
            
            if output.count == 40 {
                print(output); output = ""
            }
        }
        
        if i.count == 2 {
            x += Int(i[1])!
        }
    }
}

part1()
part2()

//: [Next](@next)
