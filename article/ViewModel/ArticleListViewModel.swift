//
//  ArticleListViewModel.swift
//  article
//
//  Created by Safhone on 3/5/18.
//  Copyright © 2018 Safhone. All rights reserved.
//

import Foundation
import UIKit

class ArticleListViewModel {
    
    private var webService: WebService
    private (set) var articleViewModel: [ArticleViewModel] = [ArticleViewModel]()
    private var completion: () -> () = { }
    
    init(webService: WebService, atPage: Int, withLimitation: Int, completion: @escaping () -> ()) {
        self.webService = webService
        self.completion = completion
        
        self.loadArticles(atPage: atPage, withLimitation: withLimitation)
        
    }
    
    private func loadArticles(atPage: Int, withLimitation: Int) {
        self.webService.loadArticle(atPage: atPage, withLimitation: withLimitation) { aricles in
            self.articleViewModel = aricles.map(ArticleViewModel.init)
            self.completion()
        }
    }
    
//    func articleAt(index: Int) -> ArticleViewModel {
//        return self.articleViewModel[index]
//    }
    
}

class ArticleViewModel {
    
    //var id: Int?
    var title: String?
    var description: String?
    var created_date: String?
    var image: String?
    
    init(article: Article) {
        //self.id = article.id
        self.title = article.title
        self.description = article.description
        self.created_date = article.created_date
        self.image = article.image
    }


}
