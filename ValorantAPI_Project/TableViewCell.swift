//
//  TableViewCell.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 1.09.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var characterName: UILabel!
	@IBOutlet weak var characterTag: UILabel!
	@IBOutlet weak var characterIcon: UIImageView!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
