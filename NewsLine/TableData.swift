struct TableData {
    let action: String?
    let content: String?
}

extension TableData: Equatable {}

func == (lhs: TableData, rhs: TableData) -> Bool {
    return lhs.action == rhs.action && lhs.content == rhs.content
}
