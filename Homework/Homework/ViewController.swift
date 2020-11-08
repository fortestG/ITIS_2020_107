import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    private struct BaseData {
        let header: String?
        let cons: [DataCont]
    }
    
    private func loadData() {
        basesData = [
            BaseData(header: "A", cons: [
                DataCont(contact: Contact(phoneNumber: "89999999999", firstname: "Kamil", lastname: "Acksanov"))
            ]),
            BaseData(header: "G", cons: [
                DataCont(contact: Contact(phoneNumber: "85555555555", firstname: "Rasim", lastname: "Garipov"))
            ]),
            BaseData(header: "K", cons: [
                DataCont(contact: Contact(phoneNumber: "88888888888", firstname: "Kamil", lastname: "Khusnullin")),
                DataCont(contact: Contact(phoneNumber: "87777777777", firstname: "Emil", lastname: "Kamaliev")),
                DataCont(contact: Contact(phoneNumber: "86666666666", firstname: "Danil", lastname: "Korobov")),
            ]),
            BaseData(header: "M", cons: [
                DataCont(contact: Contact(phoneNumber: "80123456789", firstname: "Semen", lastname: "Marus"))
            ])
        ]
    }
    
    private var basesData: [BaseData]?
    
    private struct DataCont {
        let contact: Contact
    }
    
    private func datacont(for indexPath: IndexPath, from tableView: UITableView, title: String) -> UITableViewCell {
        let cont = tableView.dequeueReusableCell(
            withIdentifier: "Base",
            for: indexPath
        )
        cont.textLabel?.text = title
        return cont
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection pick: Int) -> Int {
        guard let basedata = basesData?[pick] else {
            return 0
            
        }
        
        return basedata.cons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let basedata = basesData?[indexPath.section]
        else {
            fatalError("Attempt to get data while it is not loaded")
            
        }

        return DataCont(for: indexPath, from: tableView, title: contData.cons[indexPath.row].contact.firstname)
    }
    
    func consNumber(in tableView: UITableView) -> Int {
        basesData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        basesData?[section].header
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactDetailViewCOntroller: ContactDetailViewController = storyboard?.instantiateViewController(identifier: "ContactDetailViewController") else {
            return
            
        }
        
        let contact = basesData?[indexPath.section].cons[indexPath.row].contact
        contactDetailViewCOntroller.contact = contact
        show(contactDetailViewCOntroller, sender: nil)

    }
}

