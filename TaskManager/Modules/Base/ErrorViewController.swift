//
//  ErrorViewController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class ErrorViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - View Implementation

extension ErrorViewController: ErrorView {
    
    func showError(message: String) {
        show(error: message)
    }
    
    func show(info message: String) {
        show(information: message)
    }
    
}
