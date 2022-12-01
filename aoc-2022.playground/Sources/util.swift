import Foundation

public func readInputArray() -> [String] {
    guard let url = Bundle.main.url(forResource: "input", withExtension: ".txt") else { fatalError() }
    do {
        return try String(contentsOf: url).components(separatedBy: "\n")
    } catch {
        print(error.localizedDescription)
        fatalError()
    }
}

public func readInputRaw() -> String {
    guard let url = Bundle.main.url(forResource: "input", withExtension: ".txt") else { fatalError() }
    do {
        return try String(contentsOf: url)
    } catch {
        print(error.localizedDescription)
        fatalError()
    }
}
