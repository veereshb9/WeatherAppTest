//
//  CodingTestNetworkManager.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
struct Sys : Codable {
	let pod : String?

	enum CodingKeys: String, CodingKey {

		case pod = "pod"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pod = try values.decodeIfPresent(String.self, forKey: .pod)
	}

}
