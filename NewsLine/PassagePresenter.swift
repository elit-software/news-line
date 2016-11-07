class PassagePresenter {

    let data: [PassageData]
    var current: [TableData]

    init(data: [PassageData]) {
        self.data = data
        self.current = TableDataBuilder.build(data: data.first!)
    }


    func action(step: String) {
        let findPassage = data.filter { (passage) -> Bool in
            return passage.name == step
        }.first!

        for new in TableDataBuilder.build(data: findPassage) {
            current.append(new)
        }
    }
}
