//
//  SeeAllVC.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import UIKit

class SeeAllVC: UIViewController {
    
    //MARK: UI Elements
    
    private let searchView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchField: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: "Search for a movie", attributes: [.foregroundColor: UIColor.white])
        field.font = .systemFont(ofSize: 14, weight: .regular)
        field.textColor = .white
        field.addTarget(self, action: #selector(searchMovies), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let searchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 8, left: 8, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(LabelImageCell.self, forCellWithReuseIdentifier: "\(LabelImageCell.self)")
        return collection
    }()
    
    let viewModel = SeeAllVM()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = viewModel.titleString
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureViewModel() {
        viewModel.completion = { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    private func configureConstraints() {
        [searchView, collection].forEach { view.addSubview($0) }
        [searchField, searchImage].forEach { searchView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            searchView.widthAnchor.constraint(equalToConstant: 354),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            searchField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 24),
            searchField.widthAnchor.constraint(equalToConstant: 270),
            
            searchImage.widthAnchor.constraint(equalToConstant: 18),
            searchImage.heightAnchor.constraint(equalToConstant: 18),
            searchImage.centerYAnchor.constraint(equalTo: searchField.centerYAnchor),
            searchImage.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 24),
            
            collection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc private func searchMovies() {
        viewModel.movieSearchChange(searchTextField: searchField.text ?? "") {
            self.collection.reloadData()
        }
    }
}

extension SeeAllVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.filteredMovies.count > 0 {
            return viewModel.filteredMovies.count
        } else {
            return viewModel.movies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LabelImageCell.self)", for: indexPath) as! LabelImageCell
        if viewModel.filteredMovies.isEmpty {
            cell.configure(data: viewModel.movies[indexPath.item])
        } else {
            cell.configure(data: viewModel.filteredMovies[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = MovieDetailVC()
        if viewModel.filteredMovies.isEmpty {
            controller.viewModel.movie = viewModel.movies[indexPath.item]
        } else {
            controller.viewModel.movie = viewModel.filteredMovies[indexPath.item]
        }
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 280)
    }
}
