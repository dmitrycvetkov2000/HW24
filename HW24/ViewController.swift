//
//  ViewController.swift
//  HW24
//
//  Created by Дмитрий Цветков on 27.11.2022.
//

import UIKit

class ViewController: UIViewController {
 @Published var items = [NewsItem]()
   
    var titles: [String] = []
    
    weak var newsService = DI.shared.newsService
    
    func loadNews() {
        newsService?.loadNews { (result: Result<NewsList?, Error>) in
            switch result {
            case .success(let data):
                self.items.append(contentsOf: data?.results ?? [NewsItem]())
                for i in 0..<(data?.results.count ?? 0) {
                    self.titles.append((data?.results[i].title)!)
                    
                    
                    print("Заголовок \(i) - \(self.titles[i])")
                    print("Дата \(i) - \(data?.results[i].pubDate)")
                    
                    
                }

                
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews()
    }



}

