import Kanna

class Parser {

    let content: String

    init(content: String) {
        self.content = content
    }
    
    func parse() -> [PassageData] {
        var data = [PassageData]()
        if let doc = HTML(html: content, encoding: .utf8) {
            for link in doc.xpath("//tw-passagedata") {
                let name = link["name"] ?? ""
                let content = link.text ?? ""
                let passageData = PassageBuilder(name: name,
                                                 content: content).build()
                data.append(passageData)
            }
        }
        return data
    }
}
