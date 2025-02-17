//
//  SearchVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 08.02.25.
//

import Foundation

class SearchVM {
    var movie: Movie?
    var movies: [MovieResult] = []
    var movieName: String? {
        didSet {
            fetchMovies()
        }
    }
    let manager = SearchManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func fetchMovies() {
        print(movie?.page ?? 0)
        manager.getSearchList(page: (movie?.page ?? 0) + 1, name: movieName ?? "") { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.movie = data
                self.movies.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func changeMovieName(name: String?) {
        movieName = name
        success?()
    }
    
    func pagination(index: Int) {
        if index == movies.count - 2 && (movie?.page ?? 0 <= movie?.totalPages ?? 0) {
            fetchMovies()
        }
    }
    
    func reset() {
        movie = nil
        movies.removeAll()
    }
}
