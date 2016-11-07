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
                let passageData = PassageData(name: name,
                                              content: content)
                data.append(passageData)
            }
        }
        return data
    }
}
