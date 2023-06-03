//
//  AddTaskPresenter.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

protocol AddTaskView: ErrorView {
    func taskAddedSuccessfully(task: IMTaskBoard)
}

final class AddTaskPresenter: NSObject {

    private weak var view: AddTaskView?
    
    private lazy var validator: AddTaskValidator = {
        return AddTaskValidator()
    }()
    
    init(view: AddTaskView? = nil) {
        self.view = view
    }
    
}

// MARK: - Methods

extension AddTaskPresenter {
    
    func validate(inputs: IMTaskBoard) {
        if let error = validator.validate(inputs: inputs) {
            view?.showError(message: error.localizedDescription)
        } else {
            view?.taskAddedSuccessfully(task: inputs)
        }
    }
    
}
