import Foundation

extension Data {
    func string() -> String {
        var token = ""
        for i in 0..<self.count {
            token += String(format: "%02.2hhx", self[i] as CVarArg)
        }
        return token
    }
}
