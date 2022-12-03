//: [Previous](@previous)

import Foundation

let characterMappings = ["0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

var input = readInputArray().compactMap({Array($0)})

func part2() {
    var count = 0
    while input.count >= 3 {
        let three = input.prefix(3).map({Set($0)})
        let common = String(three[0].filter(three[1].contains).filter(three[2].contains))
        count += Int(characterMappings.firstIndex(of: common) ?? 0)
        
        input.removeFirst(3)
    }
    print(count)
}

func part1() {
    var i = input.compactMap({[$0.prefix($0.count/2), $0.suffix($0.count/2)]})
    print(i)

    let x = i.map({String(Set($0[0]).intersection(Set($0[1])))}).map({Int(characterMappings.firstIndex(of: $0) ?? 0)})
    print(x)

    print(x.reduce(0,+))
}

//: [Next](@next)
