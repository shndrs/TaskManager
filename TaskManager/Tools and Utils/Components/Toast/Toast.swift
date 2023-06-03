//
//  Toast.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation
import SPIndicator

final class Toast: NSObject {
    
    static let shared = Toast()
    
    private override init() {}
        
}

// MARK: - Methods

extension Toast {
    
    func show(success message: String, title: String = Strings.success.value()) {
        var indicatorView: SPIndicatorView!
        indicatorView = SPIndicatorView(title: title,
                                        message: message,
                                        preset: .done)
        indicatorView.backgroundColor = Colors.tertiaryBack
        indicatorView.titleLabel?.font = Font.bold.return(size: 15)
        indicatorView.titleLabel?.textColor = Colors.set
        indicatorView.subtitleLabel?.font = Font.regular.return(size: 13)
        indicatorView.subtitleLabel?.textColor = Colors.label
        indicatorView.present(duration: 3)
    }
    
    func show(failure message: String, title: String = Strings.error.value()) {
        var indicatorView: SPIndicatorView!
        indicatorView = SPIndicatorView(title: title,
                                        message: message,
                                        preset: .error)
        indicatorView.backgroundColor = Colors.tertiaryBack
        indicatorView.titleLabel?.font = Font.bold.return(size: 15)
        indicatorView.titleLabel?.textColor = Colors.cancel
        indicatorView.subtitleLabel?.font = Font.regular.return(size: 13)
        indicatorView.subtitleLabel?.textColor = Colors.label
        indicatorView.present(duration: 3)
    }
    
    func show(information message: String) {
        LogManager.info(input: message)
    }
    
}

