//
//  ApiManager.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 26/08/22.
//

import Foundation
import UIKit

class ApiManager {
	static let shared = ApiManager()
	
	// fetch data from tourism api
	func getTempatWisata(completion: @escaping (Result<[Place], Error>) -> Void) {
		let urlFromStr = URL(string: ApiConstant.shared.getTourismApi)
		
		URLSession.shared.request(url: urlFromStr, expecting: Response.self) { result in
			switch result {
			case .success(let data):
				completion(.success(data.places))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
}
