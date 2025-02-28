//
//  MovieDetailVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 03.02.25.
//

import Foundation

class MovieDetailVM {
    var data: [MovieResult] = []
    var movie: MovieResult?
    var manager = MovieManager()
    var titleString: String?
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func setMovie(movie: MovieResult) {
        self.movie = movie
    }
    
    func getSimilarMovies() {
        manager.getSimilarMovieList(id: movie?.id ?? 0) { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.data = data.results ?? []
                self.success?()
            }
        }
    }
}
