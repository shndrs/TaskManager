//
//  TaskBoardRouter.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class TaskBoardRouter {
    
    weak var view: TaskBoardVC?
    
}

// MARK: - Router Implementation

extension TaskBoardRouter: TaskBoardLauncher {
    
    func goToAddTask(from navigation: UINavigationController) {
        // TODO: Go to Add Task
    }
    
    static func createModule() -> TaskBoardVC {
        let view = TaskBoardVC.instantiate(storyboard: .taskBoard)
        let interactor = TaskBoardInteractor()
        let router = TaskBoardRouter()
        let presenter = TaskBoardPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        return view
    }
    
}
