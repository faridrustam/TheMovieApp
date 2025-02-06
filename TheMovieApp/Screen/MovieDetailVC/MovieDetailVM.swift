//
//  MovieDetailVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 03.02.25.
//

import Foundation

class MovieDetailVM {
    var movie: MovieResult?
    var titleString: String?
    
    func setMovie(movie: MovieResult) {
        self.movie = movie
    }
}
