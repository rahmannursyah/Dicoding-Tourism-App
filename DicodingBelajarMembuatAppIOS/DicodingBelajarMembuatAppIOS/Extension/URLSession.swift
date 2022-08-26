//
//  URLSession.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 26/08/22.
//

import Foundation

extension URLSession {
	enum CustomError: Error {
		case invalidUrl
		case invalidData
	}
	
	func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
		guard let url = url else {
			completion(.failure(CustomError.invalidUrl))
			return
		}
		
		let task = dataTask(with: url) { data, response, error in
			guard let data = data else {
				if let error = error {
					DispatchQueue.main.async {
						completion(.failure(error))
					}
				} else {
					DispatchQueue.main.async {
						completion(.failure(CustomError.invalidData))
					}
				}
				return
			}
			
			do {
				let result = try JSONDecoder().decode(expecting, from: data)
				DispatchQueue.main.async {
					completion(.success(result))
				}
			} catch {
				DispatchQueue.main.async {
					completion(.failure(error))
				}
			}

		}
		task.resume()
	}
}
