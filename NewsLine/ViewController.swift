import UIKit

class TableViewController: UITableViewController {

    let data = Parser(content: Reader(name: "A").read()).parse()

    var presenter: PassagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PassagePresenter(data: data)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.current.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let content = presenter.current[indexPath.row].content {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Content")!
            return cell
        }

        if let action = presenter.current[indexPath.row].action {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Action")!
            return cell
        }

        return UITableViewCell()
    }
}
