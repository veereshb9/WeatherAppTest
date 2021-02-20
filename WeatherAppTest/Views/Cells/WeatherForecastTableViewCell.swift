//
//  WeatherForecastTableViewCell.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
    
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    var main: Main!
    var weather: [Weather]!
    
    func updateRowAt(indexPath: IndexPath) {
        if weather.count > 0 {
            let weatherFirst = weather[0]
            self.weatherLabel.text = weatherFirst.main
        } else {
            self.weatherLabel.text = ""
        }
        self.tempLabel.text = "Temp: \(String(describing: main.temp!))"
    }
}
