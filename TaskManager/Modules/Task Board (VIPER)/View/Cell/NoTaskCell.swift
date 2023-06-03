//
//  NoTaskCell.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

protocol NoTaskAddButtonDelegate: AnyObject {
    func addButtonPressed()
}

final class NoTaskCell: BaseTableViewCell, ReusableView {
    
    weak var delegate: NoTaskAddButtonDelegate?
    
    @IBOutlet private weak var lblTitle: LabelBold! {
        didSet {
            lblTitle.text = Strings.noTaskHere.value()
        }
    }
    @IBOutlet private weak var lblSubtitle: LabelLight! {
        didSet {
            lblSubtitle.textColor = Colors.secondaryLabel
            lblSubtitle.text = Strings.addSomeTasks.value()
        }
    }
    
}

// MARK: - Methods

fileprivate extension NoTaskCell {
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        delegate?.addButtonPressed()
    }
    
}

// MARK: - Life Cycle

extension NoTaskCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
