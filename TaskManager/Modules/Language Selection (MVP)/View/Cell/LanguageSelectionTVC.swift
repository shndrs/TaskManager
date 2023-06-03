//
//  LanguageSelectionTVC.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class LanguageSelectionTVC: BaseTableViewCell, ReusableView {

    @IBOutlet private weak var lblId: LabelLight!
    @IBOutlet private weak var lblTitle: LabelBold!
    @IBOutlet private weak var imgFlag: UIImageView!
    
}

// MARK: - Methods

extension LanguageSelectionTVC {
    
    func fill(cell with: IMLanguage?) {
        guard let with = with else { return }
        lblId.text = with.id
        lblTitle.text = with.title
        imgFlag.image = with.flag
    }
    
}

// MARK: - Life Cycle

extension LanguageSelectionTVC {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .gray
    }
    
}
