import UIKit

class ViewController: UIViewController {

    let data = Parser(content: Reader(name: "A").read()).parse()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
