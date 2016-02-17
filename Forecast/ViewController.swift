//
//  ViewController.swift
//  Forecast
//
//  Created by Bart Jacobs on 17/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit
import Unbox

class ViewController: UIViewController {

    // New York
    let latitude: Double = 40.7127
    let longitude: Double = 74.0059

    // Forecast API Key
    // http://forecast.io
    let apiKey = "<FORECAST-API-KEY>"

    // MARK - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch Data
        fetchWeatherData()
    }

    // MARK - Private Helper Methods

    private func fetchWeatherData() {
        // Helpers
        let sharedSession = NSURLSession.sharedSession()

        if let url = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/\(latitude),\(longitude)") {
            // Create Data Task
            let dataTask = sharedSession.dataTaskWithURL(url) { (data, response, error) -> Void in
                if let requestError = error {
                    print("Unable to Fetch Weather Data")
                    print("\(requestError), \(requestError.localizedDescription)")

                } else if let weatherData = data {
                    self.processWeatherData(weatherData)
                }
            }
            
            dataTask.resume()
        }
    }

    private func processWeatherData(data: NSData) {
        /*
        let weatherData: WeatherData? = Unbox(data)

        if let weatherData = weatherData {
            print(weatherData.lat)
            print(weatherData.long)
        }
        */

        do {
            let weatherData: WeatherData = try UnboxOrThrow(data)

            print(weatherData.lat)
            print(weatherData.long)
            print(weatherData.windSpeed)
            print(weatherData.fahrenheit)

            for dataPoint in weatherData.hourlyDataPoints {
                print(dataPoint.fahrenheit)
            }

        } catch {
            print("Unable to Initialize Weather Data")
        }
    }

}

