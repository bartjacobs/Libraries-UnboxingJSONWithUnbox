//
//  WeatherDataPoint.swift
//  Forecast
//
//  Created by Bart Jacobs on 17/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import Unbox

struct WeatherDataPoint: Unboxable {

    let time: Int
    let windSpeed: Double
    let fahrenheit: Double

    init(unboxer: Unboxer) {
        self.time = unboxer.unbox("time")
        self.windSpeed = unboxer.unbox("windSpeed")
        self.fahrenheit = unboxer.unbox("temperature")
    }
    
}
