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
        getPopular()
        getUpcoming()
        getTopRated()
        getNowPlaying()
    }
    
    func getNowPlaying() {
        manager.request(endpoint: .nowPlaying,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "Now Playing", items: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getPopular() {
        manager.request(endpoint: .nowPlaying,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "Popular", items: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getUpcoming() {
        manager.request(endpoint: .nowPlaying,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "Upcoming", items: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getTopRated() {
        manager.request(endpoint: .nowPlaying,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "Top Rated", items: data.results ?? []))
                self.success?()
            }
        }
    }
}
