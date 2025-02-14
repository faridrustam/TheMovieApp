//
//  HomeVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 31.01.25.
//

import Foundation

struct HomeModel {
    let title: String
    let items: [MovieResult]
}

class HomeVM {
    //let movie: Movie?
    var movieItems = [HomeModel]()
    let manager = MovieManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getAllData() {
        fetchData(endpoint: .nowPlaying, title: "Now Playing")
        fetchData(endpoint: .popular, title: "Popular")
        fetchData(endpoint: .upcoming, title: "Upcoming")
        fetchData(endpoint: .topRated, title: "Top Rated")
    }
    
    func fetchData(endpoint: MovieEndpoint, title: String) {
        manager.getMovieList(endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.movieItems.append(.init(title: title, items: data.results ?? []))
                self.success?()
            }
        }
    }
}
