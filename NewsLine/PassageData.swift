struct PassageData {
    let name: String
    let content: String
}

extension PassageData: Equatable {}

func == (lhs: PassageData, rhs: PassageData) -> Bool {
    return lhs.name == rhs.name
        && lhs.content == rhs.content
}
