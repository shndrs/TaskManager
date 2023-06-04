//
//  TaskBoardRouter.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class TaskBoardRouter: NSObject {
    
    weak var view: TaskBoardVC?
    
}

// MARK: - Router Implementation

extension TaskBoardRouter: TaskBoardLauncher {
    
    func goToAddTask() {
        let view = AddTaskVC.instantiate(storyboard: .taskBoard)
        view.modalPresentationStyle = .custom
        view.transitioningDelegate = self.view
        view.delegate = self.view
        self.view?.present(view, animated: true)
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
