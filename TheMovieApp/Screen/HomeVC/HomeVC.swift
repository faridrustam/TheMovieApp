//
//  HomeVC.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 31.01.25.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: UI Elements
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "\(HomeCell.self)")
        return collection
    }()
    
    let viewModel = HomeVM()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    fileprivate func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func configureConstraints() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    fileprivate func configureViewModel() {
        viewModel.success = { [weak self] in
            self?.collection.reloadData()
        }
        
        viewModel.errorHandler = { error in
            
        }
        
        viewModel.getAllData()
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        let model = viewModel.movieItems[indexPath.row]
        cell.configure(title: model.title, data: model.items)
        cell.seeAllAction = { [weak self] in
            let controller = SeeAllVC()
            controller.viewModel.configure(movies: model.items)
            controller.viewModel.titleString = model.title
            controller.hidesBottomBarWhenPushed = true
            self?.navigationController?.show(controller, sender: nil)
        }
        cell.movieDetailAction = { [weak self] data in
            let controller = MovieDetailVC()
            controller.viewModel.setMovie(movie: data)
            controller.viewModel.titleString = data.title
            controller.hidesBottomBarWhenPushed = true
            self?.navigationController?.show(controller, sender: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 320)
    }
}
