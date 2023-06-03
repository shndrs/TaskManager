//
//  Font.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

enum Font: String {
    
    case bold = "Font-Bold"
    case medium = "Font-Medium"
    case regular = "Font-Regular"
    case light = "Font-Light"
    
    func `return`(size: CGFloat) -> UIFont {
        switch self {
            case .bold:
                switch Language.current() {
                case .italian:
                    return UIFont(name: "AvenirNext-Bold", size: size)!
                case .english:
                    return UIFont(name: "AvenirNext-Bold", size: size)!
                }
            case .medium:
            switch Language.current() {
                case .italian:
                    return UIFont(name: "AvenirNext-Medium", size: size)!
                case .english:
                    return UIFont(name: "AvenirNext-Medium", size: size)!
            }
            case .regular:
            switch Language.current() {
                case .italian:
                    return UIFont(name: "AvenirNext-Regular", size: size)!
                case .english:
                    return UIFont(name: "AvenirNext-Regular", size: size)!
            }
            case .light:
            switch Language.current() {
                case .italian:
                return UIFont(name: "AvenirNext-UltraLight", size: size)!
                case .english:
                    return UIFont(name: "AvenirNext-UltraLight", size: size)!
            }
        }
    }
    
    static func bold(language: Language, size: CGFloat = 15) -> UIFont {
        switch language {
        case .italian:
            return UIFont(name: "AvenirNext-Bold", size: size)!
        case .english:
            return UIFont(name: "AvenirNext-Bold", size: size)!
        }
    }
    
    // MARK: - Print Fonts and Families in Console
    
    static func printAllFonts() {
        for family in UIFont.familyNames {
            print("------------> \(family)")
            for font in UIFont.fontNames(forFamilyName: family) {
                print("===> \(font)")
            }
        }
    }
    
}
