import UIKit

class TableViewController: UITableViewController, ActionCellDelegate {

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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Content")! as? ContentCell
            cell?.contentLabel.text = content
            return cell!
        }

        if let action = presenter.current[indexPath.row].action {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Action")! as? ActionCell
            cell?.actionButton.setTitle(action, for: .normal)
            cell?.delegate = self
            return cell!
        }

        return UITableViewCell()
    }

    func actionTriggered(_ action: String) {
        presenter.action(step: action)
        tableView.reloadData()
    }
}
