//
//  CodingTestNetworkManager.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
struct Clouds : Codable {
	let all : Int?

	enum CodingKeys: String, CodingKey {

		case all = "all"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		all = try values.decodeIfPresent(Int.self, forKey: .all)
	}

}
