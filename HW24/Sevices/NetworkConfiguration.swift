//
//  NetworkConfiguration.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import Foundation

class NetworkConfiguration {
    private let apiUrl = "https://newsdata.io/api/1/news?apikey=pub_139268e9e760f74d8cc829c3cb8887131207b&q=pegasus&language=en"
    private let apiKey = "pub_139268e9e760f74d8cc829c3cb8887131207b"
    
    func getHeaders() -> [String : String] {
        return ["apikey" : apiKey]
    }
    func getBaseUrl() -> String {
        return apiUrl
    }
}
 
//https://newsdata.io/api/1/news?apikey=pub_139268e9e760f74d8cc829c3cb8887131207b&q=pegasus&language=en
