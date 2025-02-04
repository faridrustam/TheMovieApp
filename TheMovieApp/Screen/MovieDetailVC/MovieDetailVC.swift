//
//  MovieDetailVC.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 03.02.25.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    //MARK: UI Elements
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(MovieDetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieDetailHeaderCell.self)")
        collection.register(MovieCell.self, forCellWithReuseIdentifier: "\(MovieCell.self)")
        return collection
    }()
    
    let viewModel = MovieDetailVM()
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = viewModel.titleString ?? ""
    }
    
    private func configureConstraints() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension MovieDetailVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieCell.self)", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(MovieDetailHeaderCell.self)", for: indexPath) as! MovieDetailHeaderCell
        let model = viewModel.movie
        header.callElement(backImage: model?.backdropPath ?? "",
                           poster: model?.posterPath ?? "",
                           name: model?.title ?? "",
                           language: model?.originalLanguage ?? "",
                           date: model?.releaseDate ?? "",
                           rating: model?.voteAverage ?? 0)
        return header
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 400)
    }
}
