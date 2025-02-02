//
//  Endpoints.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import Foundation

enum EncodingType {
    case url
    case json
}

enum Endpoint: String, CaseIterable {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
}
