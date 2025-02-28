//
//  FirebaseManager.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 19.02.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    func authenticateUser(email: String, password: String, completion: @escaping (String?) -> Void) {
        if Auth.auth().currentUser == nil {
            signUp(email: email, password: password, completion: completion)
        } else {
            signIn(email: email, password: password, completion: completion)
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping((String?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                completion(error.localizedDescription)
            } else if let result {
                UserDefaults.standard.set(result.user.uid, forKey: "userId")
                completion(nil)
            }
            
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping((String?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                completion(error.localizedDescription)
            } else if let result {
                UserDefaults.standard.set(result.user.uid, forKey: "userId")
                completion(nil)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            print("Signed out successfully")
        } catch let error as NSError {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
