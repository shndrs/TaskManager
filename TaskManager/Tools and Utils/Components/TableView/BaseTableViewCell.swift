//
//  BaseTableViewCell.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        backgroundColor = Colors.secondaryBack
    }

}
