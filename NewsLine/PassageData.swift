struct PassageData {
    let name: String
    let content: String
    let next: [String]
}

extension PassageData: Equatable {}

func == (lhs: PassageData, rhs: PassageData) -> Bool {
    return lhs.name == rhs.name
        && lhs.content == rhs.content
        && lhs.next == rhs.next
}
