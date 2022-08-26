//
//  ApiManager.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 26/08/22.
//

import Foundation
import UIKit
import Kingfisher

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
	
	//	fetch image from url string from inside tempat wisata model
	func downloadImage(urlStr: String, completion: @escaping (Result<UIImage, KingfisherError>) -> Void) {
		let url = URL(string: urlStr)
		
		guard let url = url else { return }
		
		let resource = ImageResource(downloadURL: url)
		
		KingfisherManager.shared.retrieveImage(with: resource) { result in
			switch result {
			case .success(let data):
				completion(.success(data.image))
			case .failure(let error):
				completion(.failure(error))
			}
		}
		
	}
}
