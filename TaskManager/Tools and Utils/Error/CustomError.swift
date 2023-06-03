//
//  CustomError.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

protocol ErrorProtocol: LocalizedError {
    var title: String? { get }
}

struct CustomError: ErrorProtocol {

    var title: String?
    var errorDescription: String? {
        return _description
    }
    var failureReason: String? {
        return _description
    }
    private var _description: String

    init(title: String = Strings.error.value(), description: String) {
        self.title = title
        self._description = description
    }
    
}
