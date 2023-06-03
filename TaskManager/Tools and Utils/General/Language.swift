//
//  Language.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation
import UIKit

enum Language: String {
    
    case italian = "it"
    case english = "en"
    
}

// MARK: - Methods

extension Language {
    
    static func getLang(with string: String) -> Language {
        switch string {
        case Language.italian.rawValue:
            return Language.italian
        case Language.english.rawValue:
            return Language.english
        default:
            return Language.english
        }
    }
    
    static func current() -> Language {
        let storage = LightStorage()
        return getLang(with: storage[.language] ?? Strings.empty)
    }
    
    static func set(language: String) {
        let storage = LightStorage()
        storage[.language] = language
    }
    
    static func getLangs() -> [IMLanguage] {
        let italian = IMLanguage(id: Language.italian.rawValue,
                                 title: Strings.italian.value(),
                                 flag: Images.placeholder)
        let english = IMLanguage(id: Language.english.rawValue,
                                 title: Strings.english.value(),
                                 flag: Images.placeholder)
        let items = [
            italian,
            english
        ]
        return items
    }
    
}

// MARK: - Language Model

struct IMLanguage {
    
    var id: String!
    var title: String!
    var flag: UIImage?
    
}
