class PassagePresenter {

    let data: [PassageData]
    var current: [PassageData]

    init(data: [PassageData]) {
        self.data = data
        self.current = [data.first!]
    }


    func action(step: String) {
        let findPassage = data.filter { (passage) -> Bool in
            return passage.name == step
        }.first!
        current.append(findPassage)
    }
}
