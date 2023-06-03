//
//  TaskBoardVC.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class TaskBoardVC: TableBaseViewController {

    private var tasks: [IMTaskBoard] = []
    public var presenter: TaskBoardViewToPresenter?
    
    override func tableSetup() {
        super.tableSetup()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// MARK: - Life Cycle

extension TaskBoardVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTitle = true
        title = Strings.myTasks.value()
        tableView.asyncReload()
    }
    
}

// MARK: - TableView Implementation

extension TaskBoardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ClearCell()
    }
    
}

// MARK: - Presenter to View Implementation

extension TaskBoardVC: TaskBoardPresenterToView {
    
    func set(table with: [IMTaskBoard]) {
        tasks = with
        tableView.asyncReload()
    }
    
}
