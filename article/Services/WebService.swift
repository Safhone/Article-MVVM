//
//  WebService.swift
//  article
//
//  Created by Safhone on 3/5/18.
//  Copyright © 2018 Safhone. All rights reserved.
//

import Foundation

class WebService {
    
    func loadArticle(atPage: Int, withLimitation: Int, completion: @escaping ([Article]) -> ()) {
        
        var article = [Article]()
        let url = URL(string: "http://api-ams.me/v1/api/articles?page=\(atPage)&limit=\(withLimitation)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json",                           forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",                           forHTTPHeaderField: "Accept")
        request.addValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {                
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)

                let dictionary = json as! [String: Any]
                let articleDictionary = dictionary["DATA"] as! [[String: Any]]
                
                article = articleDictionary.flatMap(Article.init)
                
                DispatchQueue.main.async {
                    completion(article)
                }
            }
            
        }.resume()
        
    }
    
}
