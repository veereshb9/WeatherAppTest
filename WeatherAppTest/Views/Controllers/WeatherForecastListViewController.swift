//
//  TemperatureAndWeatherListViewController.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
import UIKit

class WeatherForecastListViewController: UIViewController {
    
    @IBOutlet weak var weatherForecastListTableView: UITableView!
    var list: [List]!
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
    func prepareView() {
        self.navigationItem.backButtonTitle = city.name
    }
}

extension WeatherForecastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherForecastDetailViewController = self.storyboard?.instantiateViewController(identifier: StoryBoardIdentifiers.WeatherForecastDetailViewController) as? WeatherForecastDetailViewController
        weatherForecastDetailViewController?.main = list[indexPath.row].main
        weatherForecastDetailViewController?.weather = list[indexPath.row].weather
        weatherForecastDetailViewController?.city = city
        self.navigationController?.pushViewController(weatherForecastDetailViewController ?? WeatherForecastDetailViewController(), animated: true)
    }
}

extension WeatherForecastListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherForecastTableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.WeatherForecastTableViewCell, for: indexPath) as? WeatherForecastTableViewCell
        weatherForecastTableViewCell?.main = list[indexPath.row].main
        weatherForecastTableViewCell?.weather = list[indexPath.row].weather
        weatherForecastTableViewCell?.updateRowAt(indexPath: indexPath)
        return weatherForecastTableViewCell ?? WeatherForecastTableViewCell()
    }
    
    
}
