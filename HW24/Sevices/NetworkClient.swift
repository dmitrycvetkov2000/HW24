//
//  NewsService.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import Foundation

enum Method: String {
    case get, put, post
    
    var value: String {
        self.rawValue.uppercased()
    }
}

class NetworkClient: NSObject, URLSessionTaskDelegate {
    private let config = NetworkConfiguration()
    private let configurationOfSession = URLSessionConfiguration.default
    
    private lazy var urlSession: URLSession? = {
        let urlSession = URLSession.init(configuration: configurationOfSession)
        return urlSession
    }()
    
    private var dataTask: URLSessionDataTask? = nil
    
    func request<T:Codable>(path: String, method: Method, parameters: [String:String] = [String:String](), completion: @escaping(Result<T?, Error>) -> Void) {
        let apiPath = "\(config.getBaseUrl())\(path)"
        guard let url = URL(string: apiPath) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.value
        let headers = config.getHeaders()
        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        self.dataTask = urlSession?.dataTask(with: urlRequest, completionHandler: { data, urlResponse, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            if let response = urlResponse as? HTTPURLResponse {
                if response.statusCode >= 200 && response.statusCode < 400 {
                    
                }
            }
            if let data = data {
                var json = String(data: data, encoding: .utf8)
                let content = JsonHelper.shared.decode(data: data, T.self)
                DispatchQueue.main.async {
                    completion(.success(content))
                    print(json)
                }
                
                
            }
        })
        self.dataTask?.resume()
    }
    
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        <#code#>
//    }
}
