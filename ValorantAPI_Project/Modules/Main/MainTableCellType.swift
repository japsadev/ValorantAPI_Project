//
//  MainTableCellType.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 3.09.2023.
//

import Foundation

enum MainTableCellType {
	case icon
	case description
	case categorySegmented
	case agents(model: [AgentDataResponse])
}
