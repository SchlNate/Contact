//
//  ContactCellTableViewCell.swift
//  Contact
//
//  Created by Nathan Schlechte on 11/29/17.
//  Copyright © 2017 Nathan Schlechte. All rights reserved.
//

import UIKit

class ContactCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
