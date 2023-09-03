//
//  MainViewModel.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

final class MainViewModel: MainViewModelProtocol {
	var delegate: MainViewModelDelegate?
	var agents: [AgentDataResponse] = []
	var mainTableCellType: [MainTableCellType] = []
	private let dataProvider: MainDataProviderProtocol
	
	init(dataProvider: MainDataProviderProtocol) {
		self.dataProvider = dataProvider
	}
	
	func fetchAgents() {
		let mainEnpoint: MainEndpoint = .agents
		let mainParameters: [MainParameter] = [.language("tr-TR")]
		dataProvider.fetchAgents(endpoint: mainEnpoint, parameters: mainParameters) { result in
			switch result {
			case .success(let agents):
				guard let agentData = agents.data
				else { return }
				self.agents = agentData
				
				self.mainTableCellType.append(.icon)
				self.mainTableCellType.append(.description)
				self.mainTableCellType.append(.categorySegmented)
				self.mainTableCellType.append(.agents(model: agentData))
				self.notify(with: .reloadTableView)
			case .failure(let error):
				break
			}
		}
	}
	
	private func notify(with notify: MainViewNotify) {
		delegate?.handle(notify: notify)
	}
}
