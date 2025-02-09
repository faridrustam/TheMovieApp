//
//  HomeVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 31.01.25.
//

import Foundation

struct MovieModel {
    let title: String
    let items: [MovieResult]
}

class HomeVM {
    //let movie: Movie?
    var movieItems = [MovieModel]()
    let manager = NetworkManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getAllData() {
        fetchMovies(endpoint: .nowPlaying, title: "Now Playing")
        fetchMovies(endpoint: .popular, title: "Popular")
        fetchMovies(endpoint: .upcoming, title: "Upcoming")
        fetchMovies(endpoint: .topRated, title: "Top Rated")
    }
    
    func fetchMovies(endpoint: MovieEndpoint, title: String) {
        manager.request(path: endpoint.path, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: title, items: data.results ?? []))
                self.success?()
            }
        }
    }
}
