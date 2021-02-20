//
//  CityViewController.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet var cityTextField: UITextField!
    var cityViewModel = CityViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func didTapOnLookUpButton(_ sender: UIButton) {
        cityViewModel.getWeatherFor(city: cityTextField.text ?? "") { openWeatherResponse in
            debugPrint("Response Object \(openWeatherResponse)")
            DispatchQueue.main.async {
                let weatherForecastListViewController = self.storyboard?.instantiateViewController(identifier: StoryBoardIdentifiers.WeatherForecastListViewController) as? WeatherForecastListViewController
                weatherForecastListViewController?.list = openWeatherResponse.list
                weatherForecastListViewController?.city = openWeatherResponse.city
                self.navigationController?.pushViewController(weatherForecastListViewController ?? WeatherForecastListViewController(), animated: true)
            }
        } failure: { error in
            debugPrint("Error is \(String(describing: error?.localizedDescription))")
        }
    }

}

