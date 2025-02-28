//
//  MovieManager.swift
//  TheMovieApp
//
//  Created by Samxal Quliyev  on 07.02.25.
//

import Foundation

protocol MovieManagerUseCase {
    func getMovieList(endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void))
    func getSimilarMovieList(id: Int, completion: @escaping((Movie?, String?) -> Void))
}

class MovieManager: MovieManagerUseCase {
    let manager = NetworkManager()
    
    func getMovieList(endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void)) {
        let path = endpoint.path
        manager.request(path: path, model: Movie.self, completion: completion)
    }
    
    func getSimilarMovieList(id: Int, completion: @escaping((Movie?, String?) -> Void)) {
        let path = MovieEndpoint.similar(id: id).path
        manager.request(path: path, model: Movie.self, completion: completion)
    }
}
