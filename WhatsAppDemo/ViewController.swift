//
//  ViewController.swift
//  WhatsAppDemo
//
//  Created by Sneha Harke on 04/06/19.
//  Copyright © 2019 Sneha Harke. All rights reserved.
//

import UIKit
var selectedIndex : Int = -1

class ViewController: UIViewController {

    @IBOutlet weak var readByTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readByTableView.dataSource = self
        readByTableView.delegate = self
        readByTableView.register(UINib(nibName: "ReadByTableViewCell", bundle: nil), forCellReuseIdentifier: "ReadByTableViewCell")
        readByTableView.tableFooterView = UIView()
    }
}

extension UIViewController : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReadByTableViewCell", for: indexPath) as? ReadByTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 100
        } else {
            return 90
        }
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReadByTableViewCell", for: indexPath) as? ReadByTableViewCell else { return }
        if indexPath.row == selectedIndex {
            print("------SelectedIndex")
        } else {
            print("------deselected")
        }
        
        cell.setSelected(false, animated: true)
        
        print("Initial commit")
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ReadByTableViewCell else {return}
        tableView.beginUpdates()
        if indexPath.row == selectedIndex {
            selectedIndex = -1
        }else{
            selectedIndex = indexPath.row
            cell.setSelected(true, animated: true)
        }
        tableView.endUpdates()
    }
    
}
