//
//  TaskBoardInteractor.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

final class TaskBoardInteractor {
    
    var tasks: [IMTaskBoard] = []
    
    var presenter: TaskBoardInteractorToPresenter?
    
}

// MARK: - Presenter To Interactor

extension TaskBoardInteractor: TaskBoardPresenterToInteractor {
    
    func add(task: IMTaskBoard) {
        tasks.append(task)
        presenter?.set(table: tasks)
    }
    
    func update(tasks: [IMTaskBoard]) {
        self.tasks = tasks
    }
    
}
