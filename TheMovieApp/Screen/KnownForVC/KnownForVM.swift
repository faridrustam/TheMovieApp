//
//  KnownForVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 07.02.25.
//

import Foundation

class KnownForVM {
    var data: [KnownFor] = []
    var id: Int?
    let manager = NetworkManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    
}
