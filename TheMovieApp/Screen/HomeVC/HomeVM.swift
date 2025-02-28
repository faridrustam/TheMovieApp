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
    var movie: Movie?
    var movieItems = [MovieModel]()
    let manager = MovieManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    var movies: [MovieResult] = []
    
    func getAllData() {
        fetchData(page: movie?.page ?? 0, endpoint: .nowPlaying, title: "Now Playing")
        fetchData(page: movie?.page ?? 0, endpoint: .popular, title: "Popular")
        fetchData(page: movie?.page ?? 0, endpoint: .upcoming, title: "Upcoming")
        fetchData(page: movie?.page ?? 0, endpoint: .topRated, title: "Top Rated")
    }
    
    func fetchData(page: Int, endpoint: MovieEndpoint, title: String) {
        manager.getMovieList(endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.movie = data
                self.movieItems.append(.init(title: title, items: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == movieItems.count - 2 && (movie?.page ?? 0 <= movie?.totalPages ?? 0) {
            getAllData()
        }
    }
    
    func reset() {
        movie = nil
        movieItems.removeAll()
    }
}
