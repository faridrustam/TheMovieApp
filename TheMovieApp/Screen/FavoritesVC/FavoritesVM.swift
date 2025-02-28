//
//  FavoritesVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 24.02.25.
//

import Foundation

class FavoritesVM {
    var movies: [MovieResult] = []
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getData() {
        FirestoreManager.shared.fetchMoviesFromFireStore { [weak self] result, errorMessage in
            if let errorMessage {
                self?.errorHandler?(errorMessage)
            } else if let result {
                self?.movies = result
                self?.success?()
            }
        }
    }
    
    func deleteData(id: Int) {
        FirestoreManager.shared.deleteMovieFromFireStore(movieId: id) { message in
            print(message)
        }
        self.success?()
    }
    
    func reset() {
        movies.removeAll()
    }
}
