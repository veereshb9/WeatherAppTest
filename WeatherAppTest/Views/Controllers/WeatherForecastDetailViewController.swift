//
//  WeatherForecastDetailViewController.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
import UIKit

class WeatherForecastDetailViewController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var feelsLikeTempLabel: UILabel!
    
    var main: Main!
    var weather: [Weather]!
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareView()
    }
    
    func prepareView() {
        self.navigationItem.backButtonTitle = city.name
        self.tempLabel.text = "\(String(describing: main.temp!))"
        self.feelsLikeTempLabel.text = "Feels Like: \(main.feels_like!)"
        if weather.count > 0 {
            let weatherFirst = weather[0]
            self.weatherTypeLabel.text = weatherFirst.main
            self.weatherDescLabel.text = weatherFirst.description
        } else {
            self.weatherTypeLabel.text = ""
            self.weatherDescLabel.text = ""
        }
    }
}
