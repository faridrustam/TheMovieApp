//
//  ActorVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 06.02.25.
//

import Foundation

class ActorVM {
    var data: [ActorResult] = []
    let manager = ActorManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getActors() {
        manager.getActorList { data, errorMessage in
            if let errorMessage {
                self.errorHandler?(errorMessage)
            } else if let data {
                self.data = data.results ?? []
                self.success?()
            }
        }
    }
}
