//
//  TaskBoardAbstractions.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

protocol TaskBoardViewToPresenter: AnyObject {
    var view: TaskBoardPresenterToView? { get set }
    var interactor: TaskBoardPresenterToInteractor? { get set }
    var router: TaskBoardLauncher? { get set }
    
    func goToAddTask(from navigation: UINavigationController)
    func add(task: IMTaskBoard)
}

protocol TaskBoardPresenterToView: AnyObject {
    func set(table with: [IMTaskBoard])
}

protocol TaskBoardLauncher: AnyObject {
    static func createModule() -> TaskBoardVC
    func goToAddTask(from navigation: UINavigationController)
}

protocol TaskBoardPresenterToInteractor: AnyObject {
    func add(task: IMTaskBoard)
}

protocol TaskBoardInteractorToPresenter: AnyObject {
    func set(table with: [IMTaskBoard])
}
