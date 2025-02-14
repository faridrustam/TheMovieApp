//
//  ActorManager.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 08.02.25.
//

import Foundation

protocol ActorManagerUseCase {
    func getActorList(page: Int, completion: @escaping ((Actor?, String?) -> Void))
    func getActorMovies(actorId: Int, completion: @escaping ((ActorMovies?, String?) -> Void))
}

class ActorManager: ActorManagerUseCase {
    let manager = NetworkManager()
    
    func getActorList(page: Int, completion: @escaping ((Actor?, String?) -> Void)) {
        let path = ActorEndpoint.actor(page: page).path
        manager.request(path: path, model: Actor.self, completion: completion)
    }
    
    func getActorMovies(actorId: Int, completion: @escaping ((ActorMovies?, String?) -> Void)) {
        let path = ActorEndpoint.actorMovies(id: actorId).path
        manager.request(path: path, model: ActorMovies.self, completion: completion)
    }
}
