//
//  RoundedTableViewCell.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class RoundedTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addCornerRadius(radius: 16)
        backView.backgroundColor = Colors.primaryBack
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
