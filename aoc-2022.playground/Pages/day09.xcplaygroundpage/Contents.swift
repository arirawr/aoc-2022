//: [Previous](@previous)

import Foundation

let input = readInputArray().compactMap({$0.components(separatedBy: " ")}).dropLast().map({[$0[0], Int($0[1])!]})

struct Rope {
    var x: Int = 0
    var y: Int = 0
    var history = Set<String>.init()
}

var rope = [Rope]()

func move(direction: String, distance: Int) {
    for _ in 0..<distance {
        switch direction {
            case "R": rope[0].x += 1
            case "L": rope[0].x -= 1
            case "U": rope[0].y += 1
            case "D": rope[0].y -= 1
            default: print("error")
        }
        rope[0].history.insert("\(rope[0].x),\(rope[0].y)")
        for i in 0..<rope.count-1 {
            moveTail(lead: rope[i], follow: &rope[i+1])
        }
    }
}

func moveTail(lead: Rope, follow: inout Rope) {
    let dx = lead.x - follow.x
    let dy = lead.y - follow.y
    let adx = abs(dx)
    let ady = abs(dy)

    if adx <= 1 && ady <= 1 {  }
    else if adx * ady > 1 {
        follow.x += (dx / adx)
        follow.y += (dy / ady)
    }
    else if adx > 0 {
        follow.x += (dx / adx)
    }
    else {
        follow.y += (dy / ady)
    }
    follow.history.insert("\(follow.x),\(follow.y)")
}

func simulate(length: Int) {
    rope = []
    for _ in 0..<length {
        rope.append(Rope())
    }
    
    for i in input {
        move(direction: i[0] as! String, distance: i[1] as! Int)
    }
    print(rope[length-1].history.count)
}

func part1() { simulate(length: 2) }
func part2() { simulate(length: 10) }

part1()
part2()

//: [Next](@next)
