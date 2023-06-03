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
    
    private lazy var addBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add,
                               target: self,
                               action: #selector(addAction))
    }()
    
    override func tableSetup() {
        super.tableSetup()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        register(reuseIds: ReuseIds.taskBoard)
    }
    
}

// MARK: - Methods

fileprivate extension TaskBoardVC {
    
    @objc func addAction() {}
    
}

// MARK: - Life Cycle

extension TaskBoardVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTitle = true
        title = Strings.myTasks.value()
        navigationItem.setRightBarButton(addBarButton,
                                         animated: true)
        tableView.asyncReload()
    }
    
}

// MARK: - TableView Implementation

extension TaskBoardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch tasks.count {
        case 0:
            return 1
        default:
            return tasks.count
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tasks.count {
        case 0:
            let cell = tableView
                .dequeueReusableCell(withIdentifier: NoTaskCell.reuseIdentifier)
                    as? NoTaskCell
            cell?.delegate = self
            return cell ?? ClearCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TaskBoardTVC.reuseIdentifier) as? TaskBoardTVC
            cell?.fill(cell: tasks[indexPath.row])
            return cell ?? ClearCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tasks.count == 0 ? (view.frame.height - 100) : (UITableView.automaticDimension)
    }
    
}

// MARK: - Presenter to View Implementation

extension TaskBoardVC: TaskBoardPresenterToView {
    
    func set(table with: [IMTaskBoard]) {
        tasks = with
        tableView.asyncReload()
    }
    
}

// MARK: - No Task Add Button Delegate

extension TaskBoardVC: NoTaskAddButtonDelegate {
    
    func addButtonPressed() {
        addAction()
        LogManager.info(input: Strings.appName.value())
    }
    
}
