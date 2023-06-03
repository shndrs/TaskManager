//
//  LanguageSelectionPresenter.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

protocol LanguageSelectionView: BaseView {
    func set(table with: [IMLanguage])
}

final class LanguageSelectionPresenter: NSObject {
    
    private weak var view: LanguageSelectionView?
    
    init(view: LanguageSelectionView? = nil) {
        self.view = view
    }

}

// MARK: - Methods

extension LanguageSelectionPresenter {
    
    func set(language: String?) {
        guard let language = language else { return }
        Language.set(language: language)
    }
    
    func fetchLanguages() {
        let english = IMLanguage(id: Language.english.rawValue,
                                 title: Strings.english.value(),
                                 flag: Images.england)
        let italian = IMLanguage(id: Language.italian.rawValue,
                                 title: Strings.italian.value(),
                                 flag: Images.italy)
        view?.set(table: [english, italian])
    }
    
}
