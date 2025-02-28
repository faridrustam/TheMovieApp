//
//  SeeAllVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 02.02.25.
//

import Foundation

class SeeAllVM {
    var movie: Movie?
    var movies: [MovieResult] = []
    var filteredMovies: [MovieResult] = []
    var titleString: String?
    var completion: (() -> Void)?
    
    func configure(movies: [MovieResult]) {
        self.movies = movies
        completion?()
    }
    
    func filterSearch(searchText: String, completion: (() -> Void)?) {
        movies = movies.filter {
            ($0.title?.lowercased().contains(searchText.lowercased()) ?? false)
        }
        completion?()
    }
    
    func movieSearchChange(searchTextField: String, completion: (() -> Void)?) {
        if searchTextField.isEmpty {
            filteredMovies = movies
            completion?()
        } else {
            filterSearch(searchText: searchTextField) {
                completion?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == movies.count - 2 && (movie?.page ?? 0 <= movie?.totalPages ?? 0) {
            
        }
    }
}
