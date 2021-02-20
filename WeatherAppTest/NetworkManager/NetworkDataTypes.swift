//
//  NetworkDataTypes.swift
//  CTNetworkManager
//
//  Created by Veeresh on 09/11/20.
//  Copyright © 2020 Honeywell. All rights reserved.
//

import Foundation

public typealias JsonDataType = [String: Any]

/// Define parameters to pass along with the request and how
/// they are encapsulated into the http request itself.
public typealias CTRequestParams = [String: Any]

/// Define the Type for HTTP headers that can be added to the CTRequestBuilder
public typealias CTHTTPHeaders = [String: String]

/// Define the download response
/// - temporaryURL: url where the data been stored temporarily.
/// - response: HTTP URL response
public typealias CTDownloadResponse = (
    temporaryURL: URL?,
    response: HTTPURLResponse?
)

/// This define the type of HTTP method used to perform the request
///
/// - post: POST method
/// - put: PUT method
/// - get: GET method
/// - delete: DELETE method
/// - patch: PATCH method
public enum CTHTTPMethod: String {
    case post    = "POST"
    case put     = "PUT"
    case get     = "GET"
    case delete  = "DELETE"
    case patch   = "PATCH"
}

/// Generally used HTTP header keys
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
}

/// Generally used HTTP header values
enum ContentType: String {
    case json = "application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

/// Expected data type from a webservice
public enum CTResponseType {
    case JSON
    case Data
    case XML
}

/// Define the type for a result from webservice
/// - success: if service is successful use this case and pass along the data received.
/// - error: if error returned then use this case
public enum CTResult<T> {
    case success(T)
    case error(Error?)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .error:
            return false
        }
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    public var isError: Bool {
        return !isSuccess
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: T? {
        switch self {
        case .success(let value):
            return value
        case .error:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .error(let error):
            return error
        }
    }
}

extension CTResult {
    
    /// - parameter value: The closure to execute and create the result for.
    public init(T: () throws -> T) {
        do {
            self = try .success(T())
        } catch {
            self = .error(error)
        }
    }
    
    /// Returns the success value, or throws the failure error.
    public func unwrap() throws -> T {
        switch self {
        case .success(let value):
            return value
        case .error(let error):
            throw error ?? NetworkErrors.unknown
        }
    }
}

/// Define the type for a result from a download service
/// - success: if service is successful then use this case
/// - error: if error returned then use this case
public enum CTDownloadResult<T> {
    case success(CTDownloadResponse)
    case error(Error?)
}

/// Defining network errors
public enum NetworkErrors: Error {
    case unknown
    case badRequest
    case emptyData
    case invalidResponse
    case urlError(URLError?)
}
