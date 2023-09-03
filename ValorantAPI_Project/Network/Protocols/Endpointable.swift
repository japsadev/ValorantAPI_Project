//
//  Endpointable.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

protocol Endpointable {
	var baseURL: String { get }
	var fullPath: String { get }
	var rawValue: String { get }
}
