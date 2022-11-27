//
//  NewsItem.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import Foundation
struct NewsItem: Identifiable, Codable {
    
    var id = UUID().uuidString
    
    var title: String?
    var description: String?
    var content: String?
    var pubDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case content = "content"
        case pubDate = "pubDate"
    }
}

struct NewsList: Codable {
    var results: [NewsItem] = [NewsItem]()
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
 
