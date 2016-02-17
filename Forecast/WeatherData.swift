//
//  WeatherData.swift
//  Forecast
//
//  Created by Bart Jacobs on 17/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import Unbox

struct WeatherData: Unboxable {

    let lat: Double
    let long: Double
    let windSpeed: Double
    let fahrenheit: Double
    let hourlyDataPoints: [WeatherDataPoint]

    init(unboxer: Unboxer) {
        self.lat = unboxer.unbox("latitude")
        self.long = unboxer.unbox("longitude")

        self.windSpeed = unboxer.unbox("currently.windSpeed", isKeyPath: true)
        self.fahrenheit = unboxer.unbox("currently.temperature", isKeyPath: true)

        self.hourlyDataPoints = unboxer.unbox("hourly.data", isKeyPath: true)
    }
    
}
