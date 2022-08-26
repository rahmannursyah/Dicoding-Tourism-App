//
//  TempatWisata.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 26/08/22.
//

struct Response: Codable {
	let error: Bool
	let message: String
	let count: Int
	let places: [Place]
}

struct Place: Codable {
	let id: Int
	let name, placeDescription, address: String
	let longitude, latitude: Double
	let like: Int
	let image: String
	
	enum CodingKeys: String, CodingKey {
		case id, name
		case placeDescription = "description"
		case address, longitude, latitude, like, image
	}
}
