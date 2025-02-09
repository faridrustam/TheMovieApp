//
//  KnownForVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 07.02.25.
//

import Foundation

class ActorDetailsVM {
    var data: [Cast] = []
    var actorId: Int? {
        didSet {
            getActorMovies()
            print(actorId ?? "no id")
        }
    }
    let manager = ActorManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    var titleString: String?
    
    func getActorMovies() {
        manager.getActorMovies(actorId: actorId ?? 0) { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.data = data.cast ?? []
                self.success?()
            }
        }
    }
}
