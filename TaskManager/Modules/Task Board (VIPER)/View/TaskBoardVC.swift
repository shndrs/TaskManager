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
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        tableView.rowHeight = UITableView.automaticDimension
        register(reuseIds: ReuseIds.taskBoard)
    }
    
}

// MARK: - Methods

fileprivate extension TaskBoardVC {
    
    @objc func addAction() {
        presenter?.goToAddTask()
    }
    
    func move(from: IndexPath, to: IndexPath) {
        UIView.animate(withDuration: 1, animations: {
            self.tableView.moveRow(at: from, to: to)
        }) { (true) in
            // write here code to remove score from array at position "at" and insert at position "to" and after reloadData()
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let fromIndexPath = IndexPath(row: 4, section: 0)
        let toIndexPath = IndexPath(row: 1, section: 0)
        move(from: fromIndexPath, to: toIndexPath)
    }
    
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

extension TaskBoardVC: UITableViewDelegate,
                       UITableViewDataSource,
                       UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = tasks[indexPath.row]
        return [ dragItem ]
    }
    
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
            let cell = tableView
                .dequeueReusableCell(withIdentifier: TaskBoardTVC.reuseIdentifier)
                    as? TaskBoardTVC
            cell?.fill(cell: tasks[indexPath.row])
            return cell ?? ClearCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tasks.count == 0 ? (view.frame.height - 100) : (UITableView.automaticDimension)
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard tasks[indexPath.row].status != .completed else { return nil }
        let item = UIContextualAction(style: .normal, title: Strings.completed.value()) {
            (contextualAction, view, boolValue) in
            self.tasks[indexPath.row].status = .completed
            self.tableView.reloadRows(at: [indexPath], with: .right)
            self.presenter?.update(tasks: self.tasks)
        }
        item.backgroundColor = Colors.grassGreen
        item.image = Images.successLite
        let swipeActions = UISwipeActionsConfiguration(actions: [item])
        return swipeActions
    }
    
    func tableView(_ tableView: UITableView,
                   moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        let mover = tasks.remove(at: sourceIndexPath.row)
        tasks.insert(mover, at: destinationIndexPath.row)
        presenter?.update(tasks: self.tasks)
    }
    
    func tableView(_ tableView: UITableView,
                   canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
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
    }
    
}

// MARK: - UIViewController Transitioning Delegate

extension TaskBoardVC: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let view = PresentationController(presentedViewController: presented,
                                          presenting: presenting)
        view.presentedViewHeight = 371
        return view
    }
    
}

// MARK: - Add Task Delegate

extension TaskBoardVC: AddTaskDelegate {
    
    func add(task: IMTaskBoard) {
        Toast.shared.show(success: Strings.addedSuccessfully.value())
        presenter?.add(task: task)
    }
    
}
