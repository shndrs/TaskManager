//
//  TaskBoardTVC.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class TaskBoardTVC: RoundedTableViewCell, ReusableView {

    @IBOutlet private weak var imgIcon: UIImageView!
    @IBOutlet private weak var lblTitle: LabelBold!
    @IBOutlet private weak var lblDescription: LabelRegular! {
        didSet {
            lblDescription.textColor = Colors.secondaryLabel
        }
    }
    @IBOutlet private weak var lblStatus: LabelLight!
    
}

// MARK: - Methods

extension TaskBoardTVC {
    
    func fill(cell with: IMTaskBoard) {
        imgIcon.image = with.status.getIcon()
        lblStatus.text = with.status.getTitle()
        lblStatus.textColor = with.status.getColor()
        lblTitle.text = with.title
        lblDescription.text = with.description
    }
    
}

// MARK: - Life Cycle

extension TaskBoardTVC {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
