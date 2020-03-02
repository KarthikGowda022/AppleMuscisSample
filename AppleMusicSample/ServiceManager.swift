//
//  ServiceManager.swift
//  AppleMusicSample
//
//  Created by Karthik Shyadanhalli Madeve Gowda on 2/28/20.
//  Copyright © 2020 Karthik Shyadanhalli Madeve Gowda. All rights reserved.
//

import Foundation
import UIKit

class ServiceManager {
    
    static let shared = ServiceManager()
    
    func fetchTopTenAlbums(completion: @escaping (FeedResult) -> Void){
    
        let urlStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        guard let url = URL(string: urlStr) else { return  }
        load(url: url) { (responseData) in
            
            if let response = responseData{
                
                do{
                    let result = try JSONDecoder().decode(FeedResult.self, from: response)
                    //print(result)
                    completion(result)

                }catch{
                    print("Error in  parsing response  -\(error)")
                }
                
            }
        }
        
    }
    
    func load(url: URL, withCompletion completion: @escaping (Data?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if error == nil  {
                completion(data)
            }
            else{
                print("Error fetching data from service: \(String(describing: error?.localizedDescription))")
            }
        })
        task.resume()
    }
    
    func loadImage(with url: URL?, completion: @escaping (UIImage?) -> Void) {
        
        guard let imageUrl = url else {
            return
        }
        load(url: imageUrl) { data in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(UIImage(named: "Default"))
            }
        }
    }
}
