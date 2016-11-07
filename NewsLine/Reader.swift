import Foundation

public class Reader {

    let name: String
    let type: String
    let bundle: Bundle

    public init(name: String, type: String = "html", bundle: Bundle = Bundle.main) {
        self.name = name
        self.type = type
        self.bundle = bundle
    }

    public func read() -> String {
        if let path = bundle.path(forResource: name, ofType: type) {
            do {
                return try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            } catch {
                return ""
            }
        }
        return ""
    }
}
