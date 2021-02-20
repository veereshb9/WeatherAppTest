//
//  CodingTestNetworkManager.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
struct Wind : Codable {
	let speed : Double?
	let deg : Int?

	enum CodingKeys: String, CodingKey {

		case speed = "speed"
		case deg = "deg"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		speed = try values.decodeIfPresent(Double.self, forKey: .speed)
		deg = try values.decodeIfPresent(Int.self, forKey: .deg)
	}

}
