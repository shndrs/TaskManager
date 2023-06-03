//
//  ErrorView.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

protocol ErrorView: BaseView {
    func showError(message: String)
    func show(info message: String)
}

protocol ErrorTextField: BaseView {
    func show(error: String, in textField: BaseTextField)
}
