import Foundation

func isDuplicated(for string: String) -> Bool {
    let isDuplicated = string.count != Array(Set(string)).count
    return isDuplicated
}

isDuplicated(for: "TEST")
isDuplicated(for: "No duplicate")
