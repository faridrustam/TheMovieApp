//
//  SearchVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 08.02.25.
//

import Foundation

class SearchVM {
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
        manager.getSearchList(name: movieName ?? "") { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.movies = data.results ?? []
                self.success?()
            }
        }
    }
    
    func changeMovieName(name: String?) {
        movieName = name
        success?()
    }
}
