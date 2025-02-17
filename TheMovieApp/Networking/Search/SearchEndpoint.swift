//
//  SearchEndpoint.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 08.02.25.
//

import Foundation

enum SearchEndpoint {
    case movie(name: String, page: Int)

    var path: String {
        switch self {
        case .movie(name: let name, page: let page):
            return NetworkHelper.shared.configureURL(endpoint: "search/movie?query=\(name)&page=\(page)")
        }
    }
}
