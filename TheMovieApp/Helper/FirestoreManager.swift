//
//  FirestoreManager.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 23.02.25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class FirestoreManager {
    static let shared = FirestoreManager()
    let db = Firestore.firestore()
    
    private init() {}
    
    func saveMovieToFireStore(movie: MovieResult, completion: @escaping(String?) -> Void) {
        let data: [String: Any] = ["movieId": movie.id ?? 0,
                                   "name": movie.titleText,
                                   "poster": movie.posterPath ?? ""]
        
        guard let collection = UserDefaults.standard.string(forKey: "userId") else { return }
        do {
            db.collection(collection).document("\(movie.id ?? 0)").setData(data) { error in
                if let error = error {
                    completion("Error adding document: \(error)")
                } else {
                    print("Document added successfully")
                    completion(nil)
                }
            }
        }
    }
    
    func fetchMoviesFromFireStore(completion: @escaping ([MovieResult]?, String?) -> Void) {
        guard let collection = UserDefaults.standard.string(forKey: "userId") else { return }
        
        do {
            db.collection(collection).getDocuments(completion: { (querySnapshot, error) in
                if let error {
                    completion(nil, "Error getting documents: \(error.localizedDescription)")
                }
                
                guard let documents = querySnapshot?.documents else { return }
                var movies = [MovieResult]()
                for document in documents {
                    let data = document.data()
                    let id = data["movieId"] as? Int ?? 0
                    let titleText = data["name"] as? String ?? ""
                    let posterPath = data["poster"] as? String ?? ""
                    
                    let movie = MovieResult(id: id, title: titleText, posterPath: posterPath)
                    movies.append(movie)
                }
                completion(movies, nil)
            })
        }
    }
    
    func deleteMovieFromFireStore(movieId: Int, completion: @escaping (Bool) -> Void) {
        guard let collection = UserDefaults.standard.string(forKey: "userId") else { return }
        
        db.collection(collection).document("\(movieId)").delete { error in
            if let error {
                print("Error deleting document: \(error)")
                completion(false)
            }
        }
    }
}
