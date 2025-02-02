//
//  TabBarVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        let firstVC = UINavigationController(rootViewController: HomeVC())
        firstVC.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(systemName: "pencil.circle"), tag: 1)
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [firstVC]
    }
}
