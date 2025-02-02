//
//  SeeAllVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 02.02.25.
//

import Foundation

class SeeAllVM {
    var movies: [MovieResult] = []
    var titleString: String?
    var completion: (() -> Void)?
    
    func configure(movies: [MovieResult]) {
        self.movies = movies
        completion?()
    }
}
