//
//  ActorEndpoint.swift
//  TheMovieApp
//
//  Created by Samxal Quliyev  on 05.02.25.
//

import Foundation

enum ActorEndpoint {
    case actor
    case actorMovies(id: Int)
    
    var path: String {
        switch self {
        case .actor:
            NetworkHelper.shared.configureURL(endpoint: "person/popular")
        case .actorMovies(id: let id):
            NetworkHelper.shared.configureURL(endpoint: "person/\(id)/movie_credits")
        }
    }
}
