//
//  MainDataProvider.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

final class MainDataProvider: MainDataProviderProtocol {
	
	private let serviceManager: Networkable
	
	init(serviceManager: Networkable) {
		self.serviceManager = serviceManager
	}
	
	func fetchAgents(endpoint: Endpointable, parameters: [Parameterable], completion: @escaping (Result<AgentResponse, Error>) -> Void) {
		serviceManager.fetchData(endpoint: endpoint, parameters: parameters, completion: completion)
	}
}
