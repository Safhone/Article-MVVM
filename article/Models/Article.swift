//
//  Article.swift
//  article
//
//  Created by Safhone on 3/5/18.
//  Copyright © 2018 Safhone. All rights reserved.
//

import Foundation

class Article {
    
    var id: Int?
    var title: String?
    var description: String?
    var created_date: String?
    var image: String?
    
    init(articleViewModel: ArticleViewModel) {
        self.id = articleViewModel.id
        self.title = articleViewModel.title
        self.description = articleViewModel.description
        self.created_date = articleViewModel.created_date
        self.image = articleViewModel.image
    }
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["ID"] as? Int,
            let title = dictionary["TITLE"] as? String,
            let description = dictionary["DESCRIPTION"] as? String,
            let created_date = dictionary["CREATED_DATE"] as? String,
            let image = dictionary["IMAGE"] as? String else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.description = description
        self.created_date = created_date
        self.image = image
        
    }

}
