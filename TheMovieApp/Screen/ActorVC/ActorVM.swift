//
//  ActorVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 06.02.25.
//

import Foundation

class ActorVM {
    var data: [ActorResult] = []
    let manager = NetworkManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getActors() {
        manager.request(path: ActorEndpoint.actor.path, model: Actor.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.data = data.results ?? []
                self.success?()
            }
        }
    }
}
