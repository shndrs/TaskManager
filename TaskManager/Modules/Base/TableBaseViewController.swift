//
//  TableBaseViewController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class TableBaseViewController: BaseViewController {
    
    var largeTitle: Bool = false {
        willSet(newVal) {
            self.navigationController?
                .navigationBar
                .prefersLargeTitles = newVal
        }
    }
    var enableRefreshControl = false
    
    lazy var refreshControl: UIRefreshControl = {
        let temp = UIRefreshControl()
        temp.tintColor = Colors.white
        temp.backgroundColor = Colors.primaryTint
        return temp
    }()
    
    @IBOutlet internal weak var tableView: UITableView! {
        didSet {
            tableSetup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// - Note: Override this for table view configuration
    
    @objc func tableSetup() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.secondaryBack
        if #available(iOS 15.0, *) {
            self.tableView.sectionHeaderTopPadding = 0
        }
        if enableRefreshControl {
            refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
            tableView.addSubview(refreshControl)
        }
    }
    
    /// - Note: Override this for refresh control actions
    
    @objc func refresh(_ sender: AnyObject) {}
    
    /// - Note: Give this an proper Array of Reuse Identifiers
    
    func register(reuseIds: Array<String>) {
        for id in reuseIds {
            Register.in(component: tableView, id: id)
        }
    }
    
}
