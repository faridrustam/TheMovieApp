//
//  Endpoints.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import Foundation

enum MovieEndpoint: String {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case similar = "similar"
    
    var path: String {
        NetworkHelper.shared.configureURL(endpoint: self.rawValue)
    }
}
