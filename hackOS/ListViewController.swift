//
//  ListViewController.swift
//  hackOS
//
//  Created by iOS UNAM 07 on 26/05/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tblList: UITableView!

    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.dataSource = self

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if let lbl = cell?.contentView.viewWithTag(101) as? UILabel {
            lbl.text = names[indexPath.row]
        }
        if let btnDelete = cell?.contentView.viewWithTag(102) as? UIButton {
            btnDelete.addTarget(self, action: #selector(deleteRow(_ :)), for: .touchUpInside)
        }
        return cell!
    }
    
    @IBAction func addRow(_ sender: UIButton){
        
    }
    
    @objc func deleteRow(_ sender: UIButton){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
