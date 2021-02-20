//
//  NetworkConstants.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation

public struct NetworkConstants {

    public struct Queues {
        public static let defaultQ = Bundle.main.bundleIdentifier ?? "com.codingtest.default" + "-queue"
    }

    public struct SessionIdentifiers {
        public static let background = Bundle.main.bundleIdentifier ?? "com.codingtest.default" + "-background"
    }
}

public struct NetworkConnectionMessages {
    static let knoNetworkTitle      = "Network connection lost!"
    static let kNoNetworkAvailable  = "The connection to the server was lost. Please verify your device is connected to a wireless or cellular network, then try again."
}

public struct NetworkNotificationConstants {
    public static let networkConnectionLost = "network_connection_lost"
}

public struct URLEndPoint {
    public static let openWeather = "https://api.openweathermap.org/data/2.5/forecast"
}
