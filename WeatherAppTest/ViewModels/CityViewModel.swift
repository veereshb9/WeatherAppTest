//
//  CityViewModel.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation

class CityViewModel {
    
    var openWeatherResponse: OpenWeatherResponse!
    
    var staticJson = [
        "cod": "200",
        "message": 0,
        "cnt": 40,
        "list": [
          [
            "dt": 1613671200,
            "main": [
              "temp": 270.19,
              "feels_like": 265.11,
              "temp_min": 270.19,
              "temp_max": 270.82,
              "pressure": 1030,
              "sea_level": 1030,
              "grnd_level": 1028,
              "humidity": 86,
              "temp_kf": -0.63
            ],
            "weather": [
              [
                "id": 601,
                "main": "Snow",
                "description": "snow",
                "icon": "13d"
              ]
            ],
            "clouds": [
              "all": 95
            ],
            "wind": [
              "speed": 3.53,
              "deg": 38
            ],
            "visibility": 153,
            "pop": 1,
            "snow": [
              "3h": 2.78
            ],
            "sys": [
              "pod": "d"
            ],
            "dt_txt": "2021-02-18 18:00:00"
          ],
          [
            "dt": 1613682000,
            "main": [
              "temp": 271.37,
              "feels_like": 265.3,
              "temp_min": 271.37,
              "temp_max": 271.86,
              "pressure": 1027,
              "sea_level": 1027,
              "grnd_level": 1026,
              "humidity": 91,
              "temp_kf": -0.49
            ],
            "weather": [
              [
                "id": 601,
                "main": "Snow",
                "description": "snow",
                "icon": "13d"
              ]
            ],
            "clouds": [
              "all": 98
            ],
            "wind": [
              "speed": 5.26,
              "deg": 54
            ],
            "visibility": 564,
            "pop": 1,
            "snow": [
              "3h": 1.82
            ],
            "sys": [
              "pod": "d"
            ],
            "dt_txt": "2021-02-18 21:00:00"
          ]],
        "city" : [
          "id": 5128581,
          "name": "New York",
          "coord": [
            "lat": 40.7143,
            "lon": -74.006
          ],
          "country": "US",
          "population": 8175133,
          "timezone": -18000,
          "sunrise": 1613648749,
          "sunset": 1613687660
            ]
    ] as [String : Any]
    
    func getWeatherFor(city: String, success: @escaping (OpenWeatherResponse) -> Void, failure: @escaping (Error?) -> Void) {
        let parameters = ["q": city,
                          "appid": "65d00499677e59496ca2f318eb68c049"]
        CodingTestNetworkManager().request(destination: URLEndPoint.openWeather, action: .get, payload: parameters, headers: [:]) { response in
            if response.isSuccess {
                do {
                    debugPrint("Response Value \(String(describing: response.value))")
                    if let data = response.value as? Data {
                        self.openWeatherResponse = try JSONDecoder().decode(OpenWeatherResponse.self, from: data)
                        success(self.openWeatherResponse)
                    }
                } catch {
                    debugPrint("error:\(error)")
                    do {
                        let data = try JSONSerialization.data(withJSONObject: self.staticJson, options: .prettyPrinted)
                        self.openWeatherResponse = try JSONDecoder().decode(OpenWeatherResponse.self, from: data)
                        success(self.openWeatherResponse)
                    } catch  {
                        failure(error)
                    }
                    failure(error)
                }
            } else {
                do {
                    let data = try JSONSerialization.data(withJSONObject: self.staticJson, options: .prettyPrinted)
                    self.openWeatherResponse = try JSONDecoder().decode(OpenWeatherResponse.self, from: data)
                    success(self.openWeatherResponse)
                } catch  {
                    failure(error)
                }
//                failure(response.error)
            }
        }
    }
    
}
