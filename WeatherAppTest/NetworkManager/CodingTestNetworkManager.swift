//
//  CodingTestNetworkManager.swift
//  CodingTestWeather
//
//  Created by Veeresh on 18/02/21.
//

import Foundation
import Alamofire

public class CodingTestNetworkManager: CodingTestNetworkProtocol {

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
    public func request(destination: String,
                        action: CTHTTPMethod,
                        payload: [String: Any]? = nil,
                        headers: CTHTTPHeaders,
                        completion: @escaping (CTResult<Any>) -> Void) {
        checkForNetworkConnection { (error) in
            guard error == nil else {
                completion(.error(error))
                return
            }
            AF.request(destination, method: .get, parameters: payload, headers: nil, interceptor: nil, requestModifier: nil).response { (response) in
                switch response.result {
                case .success:
                    print("Received success response:\n \(String(describing: response))")
                    completion(.success(response.data as Any))
                case .failure(let error):
                    print("Received error response:\n \(String(describing: error))")
                    completion(.error(error))
                }
            }
        }
    }
}

extension CodingTestNetworkManager {
    public class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    /// Checks for internet con nectivity and displays the alert
    ///
    /// - Parameter completion: Closure to pass the status of the network with error object
    public func checkForNetworkConnection(completion: @escaping (Error?) -> Void) {
        if CodingTestNetworkManager.isConnectedToInternet {
            completion(nil)
        } else {
            let error = NSError(domain: "", code: 503, userInfo: [NSLocalizedDescriptionKey: NetworkConnectionMessages.knoNetworkTitle])
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NetworkNotificationConstants.networkConnectionLost), object: error, userInfo: nil)
            completion(error)
        }
    }
}
