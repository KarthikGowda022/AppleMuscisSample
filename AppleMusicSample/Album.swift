//
//  Album.swift
//  AppleMusicSample
//
//  Created by Karthik Shyadanhalli Madeve Gowda on 2/28/20.
//  Copyright © 2020 Karthik Shyadanhalli Madeve Gowda. All rights reserved.
//

import Foundation
import UIKit

class Album : Codable {
    
    let artistId : String
    let artidtUrl : String
    let albumName : String
    let artistName : String
    let copyright : String
    let id : String
    let kind : String
    let releaseDate : String
    let imageURL : String
    let url : String
    let genres : [Genre]
    
    private enum CodingKeys: String, CodingKey {
        case artistId = "artistId"
        case artidtUrl = "artistUrl"
        case albumName = "name"
        case artistName = "artistName"
        case copyright = "copyright"
        case id = "id"
        case kind = "kind"
        case releaseDate = "releaseDate"
        case imageURL = "artworkUrl100"
        case url = "url"
        case genres = "genres"
    }
}

class Genre : Codable {
    
    let genreId : String
    let name : String
    let url : String
    
    private enum CodingKeys: String, CodingKey {
        case genreId = "genreId"
        case name = "name"
        case url = "url"
    }
}

class TopList : Codable {
    
   // let author : String
    let result : [Album]
    
    private enum CodingKeys: String, CodingKey {
        //case author = "author"
        case result = "results"
    }
}


class FeedResult: Codable {
    let feed : TopList
    
    private enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
    
}
