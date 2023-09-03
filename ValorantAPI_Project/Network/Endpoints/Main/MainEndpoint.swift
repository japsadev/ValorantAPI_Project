//
//  MainEndpoint.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

enum MainEndpoint: Endpointable {
	case agents
	
	var baseURL: String {
		return "https://valorant-api.com/v1"
	}
	
	var fullPath: String {
		return baseURL + self.rawValue
	}
	
	var rawValue: String {
		switch self {
		case .agents: return "/agents"
		}
	}
}
