//
//  JsonHelper.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import Foundation

class JsonHelper {
    static let shared = JsonHelper()
    private var jsonDecoder = JSONDecoder()
    
    func decode<T:Codable>(data: Data, _ type: T.Type) -> T? {
        return try? jsonDecoder.decode(type, from: data)
    }
}
