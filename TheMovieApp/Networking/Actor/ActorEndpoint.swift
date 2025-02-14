//
//  ActorEndpoint.swift
//  TheMovieApp
//
//  Created by Samxal Quliyev  on 05.02.25.
//

import Foundation

enum ActorEndpoint {
    case actor(page: Int)
    case actorMovies(id: Int)
    
    var path: String {
        switch self {
        case .actor(page: let page):
            NetworkHelper.shared.configureURL(endpoint: "person/popular?page=\(page)")
        case .actorMovies(id: let id):
            NetworkHelper.shared.configureURL(endpoint: "person/\(id)/movie_credits")
        }
    }
}
