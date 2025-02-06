//
//  ActorEndpoint.swift
//  TheMovieApp
//
//  Created by Samxal Quliyev  on 05.02.25.
//

import Foundation

enum ActorEndpoint: String {
    case actor = "person/popular"
    
    var path: String {
        NetworkHelper.shared.configureURL(endpoint: self.rawValue)
    }
}
