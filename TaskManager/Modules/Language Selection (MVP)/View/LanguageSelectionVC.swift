//
//  LanguageSelectionVC.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class LanguageSelectionVC: TableBaseViewController {

    private var languages: [IMLanguage]?
    
    private lazy var presenter: LanguageSelectionPresenter = {
        return LanguageSelectionPresenter(view: self)
    }()
    
    override func tableSetup() {
        super.tableSetup()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.cleanFooterView()
        register(reuseIds: ReuseIds.languageSelection)
    }
    
}

// MARK: - Methods

fileprivate extension LanguageSelectionVC {
    
    @IBAction func selectPressed(_ sender: UIButton) {
        
    }
    
}

// MARK: - Life Cycle

extension LanguageSelectionVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchLanguages()
    }
    
}

// MARK: - View Implementation

extension LanguageSelectionVC: LanguageSelectionView {
    
    func set(table with: [IMLanguage]) {
        languages = with
        tableView.asyncReload()
    }
    
}

// MARK: - TableView Implementation

extension LanguageSelectionVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return languages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: LanguageSelectionTVC.reuseIdentifier)
                as? LanguageSelectionTVC
        cell?.fill(cell: languages?[indexPath.row])
        return cell ?? ClearCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.set(language: languages?[indexPath.row].id)
    }
    
}
