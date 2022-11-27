//
//  NewsService.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import Foundation

class NewsService {
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    func loadNews(completion: @escaping(Result<NewsList?, Error>) -> Void) {
        print("Загружаются новости")
        networkClient.request(path: "&q=pegasus&language=en", method: .get, completion: completion)
    }
}
