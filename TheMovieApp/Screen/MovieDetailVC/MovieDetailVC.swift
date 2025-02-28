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
        collection.showsVerticalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(MovieDetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieDetailHeaderCell.self)")
        collection.register(SimilarMoviesCell.self, forCellWithReuseIdentifier: "\(SimilarMoviesCell.self)")
        return collection
    }()
    
    let viewModel = MovieDetailVM()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = viewModel.titleString ?? ""
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favoriteTapped))
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
    
    private func configureModel() {
        viewModel.success = { [weak self] in
            self?.collection.reloadData()
        }
        viewModel.errorHandler = { error in
            print(error)
        }
        viewModel.getSimilarMovies()
    }
    
    @objc private func favoriteTapped() {
        guard let movie = viewModel.movie else { return }
        FirestoreManager.shared.saveMovieToFireStore(movie: movie) { error in
            if let error {
                self.showAlert(message: error)
            } else {
                self.showAlert(title: "Success", message: "Movie added to favorites successfully!")
            }
        }
    }
}

extension MovieDetailVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SimilarMoviesCell.self)", for: indexPath) as! SimilarMoviesCell
        cell.getData(data: viewModel.data)
        cell.similarDetailAction = { [weak self] data in
            let controller = MovieDetailVC()
            controller.viewModel.setMovie(movie: data)
            controller.viewModel.titleString = data.title
            self?.navigationController?.show(controller, sender: nil)
        }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 400)
    }
}
