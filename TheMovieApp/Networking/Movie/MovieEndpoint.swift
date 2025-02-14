//
//  Endpoints.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import Foundation

enum MovieEndpoint {
    case nowPlaying
    case popular
    case topRated
    case upcoming
    case similar
    
    var path: String {
        //NetworkHelper.shared.configureURL(endpoint: self.rawValue)
        switch self {
        case .nowPlaying:
            NetworkHelper.shared.configureURL(endpoint: "movie/now_playing")
        case .popular:
            NetworkHelper.shared.configureURL(endpoint: "movie/popular")
        case .topRated:
            NetworkHelper.shared.configureURL(endpoint: "movie/top_rated")
        case .upcoming:
            NetworkHelper.shared.configureURL(endpoint: "movie/upcoming")
        case .similar:
            NetworkHelper.shared.configureURL(endpoint: "similar")
        }
    }
}
