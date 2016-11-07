import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let html = Reader(name: "A").read()

        if let doc = HTML(html: html, encoding: .utf8) {
//            print(doc.title)

            // Search for nodes by CSS
//            for link in doc.css("tw-passagedata") {
//                print(link.text)
//            }

            // Search for nodes by XPath
            for link in doc.xpath("//tw-passagedata") {
                print(link.text)
            }
        }
    }
}
