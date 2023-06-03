//
//  IMTaskBoard.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

struct IMTaskBoard {
    
    var title: String!
    var description: String!
    var status: TaskStatus!
    
}

// MARK: - Status

enum TaskStatus: UInt8 { /// - Note: I choose UInt8 because of sufficient memory usage
    
    case completed
    case inProgress
    
    // MARK: - Methods
    
    func getIcon() -> UIImage {
        switch self {
        case .completed:
            return Images.success
        case .inProgress:
            return Images.inProgress
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .completed:
            return Strings.completed.value()
        case .inProgress:
            return Strings.inProgress.value()
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .completed:
            return Colors.grassGreen
        case .inProgress:
            return Colors.yellow
        }
    }
    
}
