//
//  SearchManager.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 08.02.25.
//

import Foundation

protocol SearchManagerUseCase {
    func getSearchList(name: String, completion: @escaping ((Movie?, String?) -> Void))
}

class SearchManager: SearchManagerUseCase {
    let manager = NetworkManager()
    
    func getSearchList(name: String, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = SearchEndpoint.movie(name: name).path
        manager.request(path: path, model: Movie.self, completion: completion)
    }
}
