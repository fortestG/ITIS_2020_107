import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    var contact: Contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = contact {
            nameLabel.text = "\(contact.firstname) \(contact.lastname)"
            phoneNumberLabel.text = contact.phoneNumber
        }
    }
}
