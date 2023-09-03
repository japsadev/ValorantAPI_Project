//
//  MainDataProviderProtocol.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

protocol MainDataProviderProtocol {
	func fetchAgents(endpoint: Endpointable, parameters: [Parameterable], completion: @escaping (Result<AgentResponse, Error>) -> Void)
}
