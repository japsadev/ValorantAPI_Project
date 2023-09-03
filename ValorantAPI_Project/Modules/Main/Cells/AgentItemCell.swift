//
//  AgentItemCell.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 3.09.2023.
//

import UIKit

class AgentItemCell: UITableViewCell {

	@IBOutlet private weak var agentNameLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
	func prepareCell(with model: AgentDataResponse) {
		agentNameLabel.text = model.displayName ?? ""
	}
}
