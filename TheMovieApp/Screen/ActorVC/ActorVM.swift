//
//  ActorVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 06.02.25.
//

import Foundation

class ActorVM {
    var actor: Actor?
    var data: [ActorResult] = []
    let manager = ActorManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getActors() {
        manager.getActorList(page: (actor?.page ?? -1) + 1) { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.data.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == data.count - 2 && (actor?.page ?? 0 <= actor?.totalPages ?? 0) {
            getActors()
        }
    }
    
    func reset() {
        actor = nil
        data.removeAll()
    }
}
