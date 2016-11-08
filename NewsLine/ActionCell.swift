import UIKit

class ActionCell: UITableViewCell {

    weak var delegate: ActionCellDelegate?

    @IBAction func actionTriggered(_ sender: Any) {
        let action = (sender as! UIButton).titleLabel?.text!
        delegate?.actionTriggered(action!)
    }

    @IBOutlet weak var actionButton: UIButton! {
        didSet {
            actionButton.titleLabel?.numberOfLines = 0
        }
    }
}

protocol ActionCellDelegate: class {
    func actionTriggered(_ action:String)
}
