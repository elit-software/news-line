import UIKit

class TableViewController: UITableViewController, ActionCellDelegate {

    let data = Parser(content: Reader(name: "Syrian Refugees").read()).parse()

    var presenter: PassagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PassagePresenter(data: data)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
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
        let indexPath = IndexPath(row: presenter.current.count - 1,
                                  section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
