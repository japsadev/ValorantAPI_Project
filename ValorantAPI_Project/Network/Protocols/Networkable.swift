//
//  Networkable.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import Foundation

protocol Networkable {
	func fetchData<T: Decodable>(endpoint: Endpointable, parameters: [Parameterable]?, completion: @escaping (Result<T, Error>) -> Void)
}

