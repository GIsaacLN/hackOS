//
//  ListViewController.swift
//  hackOS
//
//  Created by iOS UNAM 07 on 26/05/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblList: UITableView!

    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.dataSource = self
        tblList.delegate = self

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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
    -> CGFloat{
        return 110.0
    }
    
    @IBAction func addRow(_ sender: UIButton){
        names.insert("New Phrase", at: 0)
        tblList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        
    }
    
    @objc func deleteRow(_ sender: UIButton){
        let point  = sender.convert(CGPoint.zero, to: tblList)
        guard let indexPath = tblList.indexPathForRow(at: point) else{
            return
        }
        names.remove(at: indexPath.row)
        tblList.deleteRows(at: [indexPath], with: .left)
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
