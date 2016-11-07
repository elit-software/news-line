class TableDataBuilder {
    static func build(data: PassageData) -> [TableData] {
        var value = [TableData]()
        value.append(TableData(action: nil, content: data.content))
        for next in data.next {
            value.append(TableData(action: next, content: nil))
        }
        return value
    }
}
