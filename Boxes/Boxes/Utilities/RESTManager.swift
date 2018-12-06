//
//  WebServiceManager.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import UIKit

let LogEnabled = false

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

let USERS_BASE_PATH = "https://reqres.in"

class RESTManager {
    
    // MARK: - Properties
    static let shared = RESTManager()
    
    // MARK: - Initializer
    private init() {}
    
    // MARK: - Public API
    func hasInternetConnection() -> Bool {
        let reachability = Reachability()
        
        return reachability!.isReachable
    }
 
    func makeRequest<T: Codable>(from urlString: String, httpBody: Data?, completion: @escaping (_ object: T?, _ error: Error?) -> ()) {
        if hasInternetConnection() {
            guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded) else {
                fatalError("🛑 URL not formed")
            }
            
            let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
            let request = configureRequest(for: url, method: .get, httpBody: httpBody)
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        completion(nil, error)
                        Logger.log(message: "Error = \(String(describing: error))", type: .debug)
                    }
                }
                
                // Data acquired
                do {
                    if let data = data {
                        if LogEnabled {
                            print("RESPONSE: \(String(describing: String(data: data, encoding: .utf8)!))")
                        }
                        
                        let object = try JSONDecoder().decode(T.self, from: data)
                        
                        DispatchQueue.main.async {
                            completion(object, nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(nil, error)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                    
                    Logger.log(message: "Decoding error: \(error.localizedDescription)", type: .warning)
                }
            }
            
            task.resume()
        }
    }
    
    // MARK: - Private API
    private func configureRequest(for url: URL, method: HttpMethod, httpBody: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        
        var body: String?
        if let data = httpBody {
            body = String(data: data, encoding: .utf8)
        }
        
        if LogEnabled {
            print("REQUEST: \(url.absoluteString), BODY: \(body ?? "")")
        }
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let httpBody = httpBody {
            request.httpBody = httpBody
        }
        
        return request
    }
    
}
