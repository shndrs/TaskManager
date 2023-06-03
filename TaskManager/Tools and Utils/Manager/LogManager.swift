//
//  LogManager.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

final class LogManager: NSObject {}

// MARK: - Methods

extension LogManager {
    
    static func failure(_ input: Any) {
        print("❌❌ --------> \(input)")
    }
    
    static func success(_ input: Any) {
        print("✅✅ ========> \(input)")
    }
    
    
    static func info(input: Any) {
        print("✏️✏️ >>>>>>>> \(input)")
    }
    
}
