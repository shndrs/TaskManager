//
//  AddTaskVC.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

protocol AddTaskDelegate: AnyObject {
    func add(task: IMTaskBoard)
}

final class AddTaskVC: ErrorViewController {
    
    weak var delegate: AddTaskDelegate?
    
    private lazy var presenter: AddTaskPresenter = {
        return AddTaskPresenter(view: self)
    }()

    @IBOutlet private weak var backView: UIView! {
        didSet {
            backView.addBorder(color: Colors.secondaryLabel,
                               thickness: Border.light)
            backView.addCornerRadius(radius: 16)
            backView.backgroundColor = Colors.primaryBack
        }
    }
    @IBOutlet private weak var txtTitle: BaseTextField! {
        didSet {
            txtTitle.placeholder = Strings.title.value()
        }
    }
    @IBOutlet private weak var txtDescription: BaseTextField! {
        didSet {
            txtDescription.placeholder = Strings.description.value()
        }
    }
    @IBOutlet private weak var btnAdd: RoundedButton! {
        didSet {
            btnAdd.setTitle(Strings.add.value(), for: .normal)
        }
    }
    @IBOutlet private weak var btnCancel: TintButton! {
        didSet {
            btnCancel.setTitle(Strings.cancel.value(), for: .normal)
        }
    }
    
}

// MARK: - Methods

fileprivate extension AddTaskVC {
    
    @IBAction func addPressed(_ sender: RoundedButton) {
        let inputs = IMTaskBoard(title: txtTitle.text ?? Strings.empty,
                                 description: txtDescription.text ?? Strings.empty,
                                 status: .inProgress)
        presenter.validate(inputs: inputs)
    }
    
    @IBAction func cancelPressed(_ sender: TintButton) {
        self.dismiss(animated: true)
    }
    
}

// MARK: - Life Cycle

extension AddTaskVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - View Implementation

extension AddTaskVC: AddTaskView {
    
    func taskAddedSuccessfully(task: IMTaskBoard) {
        delegate?.add(task: task)
        self.dismiss(animated: true)
    }
    
}
