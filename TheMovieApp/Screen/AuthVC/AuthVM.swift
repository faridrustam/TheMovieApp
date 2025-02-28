//
//  AuthVM.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 19.02.25.
//

import Foundation
import FirebaseAuth
import UIKit

class AuthVM: UIViewController {
    
    func getAuth(email: String, password: String) {
        AuthManager.shared.authenticateUser(email: email, password: password) { errorMessage in
            if let errorMessage {
                self.showAlert(message: errorMessage)
            } else {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.tabbarRoot(windowScene: windowScene)
                }
            }
        }
    }
    
    func signOut() {
        AuthManager.shared.signOut()
    }
}
