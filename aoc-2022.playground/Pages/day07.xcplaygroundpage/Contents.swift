//: [Previous](@previous)

import Foundation

var input = readInputArray().dropLast()

class Folder {
    var name: String
    var size: Int
    var children: [Folder] = []
    var parent: Folder?
    
    init (_ name: String, _ size: Int = 0, parent: Folder? = nil) {
        self.name = name
        self.size = size
        self.parent = parent
    }
    
    func addSubfolder(_ child: Folder) {
        self.children.append(child)
    }
}

//--- Tree creation and traversal ---//

var current = Folder("/")

// Drop first so we don't recreate the root dir
for command in input.dropFirst() {
    if command.starts(with: "$ ls") {
        continue
    }
    else if command.starts(with: "$ cd") {
        let path = String(command.split(separator: " ")[2])
        
        if path == ".." {
            current.parent!.size += current.size
            current = current.parent!
        }
        else if current.children.contains(where: {$0.name == path}) {
            current = current.children.first(where: {$0.name == path})!
        }
        else {
            //create child dir and move to it
            current = Folder(path, parent: current)
        }
    }
    else if command.starts(with: "dir") {
        current.addSubfolder(Folder(
                String(command.split(separator: " ")[1]),
                parent: current))
    }
    else {
        current.size += Int(command.split(separator: " ")[0])!
    }
}

// Traverse back to top of tree
while current.parent != nil {
    current.parent!.size += current.size
    current = current.parent!
}

//--- Problemsolving ---//

func part1() {
    var sum = 0
    func recursive(_ folder: Folder) -> Int {
        for subfolder in folder.children {
            
            recursive(subfolder)

            if subfolder.size > 100000 {
                continue
            }
            else {
                sum += subfolder.size
            }
        }
        return sum
    }
    print("Sum of small folders: " + String(recursive(current)))
}

func part2() {
    let spaceRequired = 30000000 - (70000000 - current.size)
    print("Additional space required: " + String(spaceRequired))

    var options = [Int]()

    func findOptions(_ folder: Folder) {
        for subfolder in folder.children {
            findOptions(subfolder)
            if subfolder.size >= spaceRequired {
                options.append(subfolder.size)
            }
            else { continue }
        }
    }

    findOptions(current)
    print("Size of best option: " + String(options.sorted()[0]))
}

part1()
part2()

//: [Next](@next)
