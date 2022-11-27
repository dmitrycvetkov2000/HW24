//
//  DI.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import Foundation
class DI {
    static let shared = DI()
    
    lazy var networkClient: NetworkClient = {
        return NetworkClient()
    }()
    
    lazy var newsService: NewsService = {
        return NewsService(networkClient: networkClient)
    }()
}
