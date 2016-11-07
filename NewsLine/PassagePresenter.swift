class PassagePresenter {

    let data: [PassageData]

    init(data: [PassageData]) {
        self.data = data
    }

    var current: [PassageData] {
        return [data.first!]
    }
}
