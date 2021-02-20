//
//  CodingTestNetworkManager.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
struct Snow : Codable {
	let threeHour : Double?

	enum CodingKeys: String, CodingKey {
        
		case threeHour = "3h"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        threeHour = try values.decodeIfPresent(Double.self, forKey: .threeHour)
	}

}
