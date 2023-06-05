//
//  TaskBoardPresenter.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class TaskBoardPresenter: TaskBoardViewToPresenter {
    
    var view: TaskBoardPresenterToView?
    var interactor: TaskBoardPresenterToInteractor?
    var router: TaskBoardLauncher?
    
    public init(view: TaskBoardPresenterToView?,
                interactor: TaskBoardPresenterToInteractor?,
                router: TaskBoardLauncher?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func goToAddTask() {
        router?.goToAddTask()
    }

    func add(task: IMTaskBoard) {
        interactor?.add(task: task)
    }
    
    func update(tasks: [IMTaskBoard]) {
        interactor?.update(tasks: tasks)
    }
    
}

// MARK: - Iteractor To Presenter

extension TaskBoardPresenter: TaskBoardInteractorToPresenter {
    
    func set(table with: [IMTaskBoard]) {
        view?.set(table: with)
    }
    
}
