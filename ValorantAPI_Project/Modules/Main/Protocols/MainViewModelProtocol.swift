//
//  MainViewModelProtocol.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

protocol MainViewModelProtocol {
	var delegate: MainViewModelDelegate? { get set }
	var mainTableCellType: [MainTableCellType] { get set }
	var agents: [AgentDataResponse] { get set }
	
	func fetchAgents()
}

enum MainViewNotify {
	case didFetchAgent
	case errorFetchAgent(error: String)
	case reloadTableView
}

protocol MainViewModelDelegate {
	func handle(notify: MainViewNotify)
}
