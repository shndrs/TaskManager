//
//  BaseViewController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    var dismissBlock: Action?
    var enableDismiss: Bool = false {
        willSet(newValue) {
            self.navigationItem
                .setRightBarButtonItems([dismissBarButton],
                                        animated: newValue)
        }
    }
    
    private lazy var dismissBarButton: UIBarButtonItem = {
        let temp = UIBarButtonItem(image: Images.dismissModal,
                                   style: .plain,
                                   target: self,
                                   action: #selector(dismissPressed))
        temp.tintColor = Colors.label
        return temp
    }()
    
    @objc func dismissPressed() {
        self.dismiss(animated: true) { [weak self] in
            guard self != nil else { return }
            self?.dismissBlock?()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Strings.empty,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.isBeingPresented ?? false {
            enableDismiss = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.dismissBlock?()
    }

}
