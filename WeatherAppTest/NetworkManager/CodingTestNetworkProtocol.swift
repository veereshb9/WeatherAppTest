//
//  CodingTestNetworkProtocol.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
/// - An abstraction protocol for communicating with server
/// - This will act as a layer between Alamofire/Other frameworks and avoid direct dependancy

public protocol CodingTestNetworkProtocol {
    /// Execute request witha a completion handler
    ///
    /// - Parameters:
    /// - Parameter queue: The queue on which the completion handler is dispatched.
    /// - Parameter destination: complete end url string
    /// - Parameter action: type of network request. eg:- GET, POST, PUT as defined in enum - CTHTTPMethod
    /// - Parameter payload: These are the parameters we need to send along with the call.
    /// - Parameter headers: HTTP Headers, if required
    /// - Parameter completion: completion handler for processing the data
    /// - Returns: Void.
    func request(destination: String,
                 action: CTHTTPMethod,
                 payload: [String: Any]?,
                 headers: CTHTTPHeaders,
                 completion: @escaping (CTResult<Any>) -> Void
    )
}
