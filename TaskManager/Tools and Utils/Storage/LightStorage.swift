//
//  LightStorage.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

final class LightStorage {

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    // MARK: - Get and Set String Data to Database
    ///
    
    subscript(key: LightStorageKeys) -> String? {
        get {
            return defaults.string(forKey: key.rawValue)
        } set {
            defaults.set(newValue, forKey: key.rawValue)
        }
    }
    
    // MARK: - Get and Set Boolean Data to Database
    
    func set(bool: Bool, forKey: LightStorageKeys) {
        defaults.set(bool, forKey: forKey.rawValue)
    }
    
    func get(boolean forKey: LightStorageKeys) -> Bool? {
        return defaults.bool(forKey: forKey.rawValue)
    }
    
    // MARK: - Clear All UserDefaults data
    
    func resetDefaults() {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
}

// MARK: - Light Storage Keys

enum LightStorageKeys: String {
    
    case language
    
}
