//
//  Data.swift
//  Sample-card
//
//  Created by Rhapsody on 2020/3/4.
//  Copyright © 2020 Rhapsody. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var name: String
    var body: String
    //var image = String
    
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments")
             else
        {
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data
                else
            {
                return
                
            }
            
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async
                {
                completion(posts)
            }
        }
        .resume()
    }
}
