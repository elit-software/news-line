import UIKit

class TableViewController: UITableViewController {

    let data = Parser(content: Reader(name: "A").read()).parse()

    var presenter: PassagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        presenter = PassagePresenter(data: data)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.current.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
        cell.textLabel?.text = presenter.current[indexPath.row].content
        return cell
    }
}
