//
//  MainParameter.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

enum MainParameter: Parameterable {
	
	case language(String)
	
	var queryItem: URLQueryItem {
		switch self {
		case .language(let language):
			return URLQueryItem(name: "language", value: language)
		}
	}
}
