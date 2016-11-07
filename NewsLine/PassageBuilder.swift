import Kanna

class PassageBuilder {

    let name: String
    let content: String

    init(name: String, content: String) {
        self.name = name
        self.content = content
    }

    func build() -> PassageData {
        var passageContent = ""
        var next = [String]()
        for (index, component) in content.components(separatedBy: "[[").enumerated() {
            if index == 0 {
                passageContent = component.replacingOccurrences(of: "\n", with: "")
            } else {
                let filtered = component.replacingOccurrences(of: "]]", with: "").replacingOccurrences(of: "[[", with: "").replacingOccurrences(of: "\n", with: "")
                next.append(filtered.components(separatedBy: "->").first ?? "")
            }
        }
        return PassageData(name: name,
                           content: passageContent,
                           next: next)
    }
}
