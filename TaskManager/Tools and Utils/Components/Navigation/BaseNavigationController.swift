//
//  BaseNavigationController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class BaseNavigationController: UINavigationController {}

// MARK: - Life Cycle

extension BaseNavigationController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setup()
    }
    
}

// MARK: - Methods

extension BaseNavigationController {
    
    @objc func setup() {
        navBasicConfig()
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.buttonAppearance.normal.titleTextAttributes = [
                .font: Font.light.return(size: 16),
                .foregroundColor: Colors.label
            ]
            navBarAppearance.largeTitleTextAttributes = [
                .font: Font.medium.return(size: 32),
                .foregroundColor: Colors.label
            ]
            navBarAppearance.titleTextAttributes = [
                .font: Font.medium.return(size: 16),
                .foregroundColor: Colors.label
            ]
            navBarAppearance.backgroundColor = Colors.secondaryBack
            self.navigationBar.tintColor = Colors.label
            self.navigationBar.barStyle = .default
            self.navigationBar.isTranslucent = false
            self.navigationBar.standardAppearance = navBarAppearance
            self.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            self.edgesForExtendedLayout = []
        }
    }
    
}
