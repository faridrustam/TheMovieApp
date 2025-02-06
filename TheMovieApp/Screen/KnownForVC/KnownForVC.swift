//
//  KnownForVC.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 07.02.25.
//

import UIKit

class KnownForVC: UIViewController {
    
    //MARK: UI Elements
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        let controller = UICollectionView(frame: .zero, collectionViewLayout: layout)
        controller.dataSource = self
        controller.delegate = self
        controller.translatesAutoresizingMaskIntoConstraints = false
        controller.backgroundColor = .systemBackground
        controller.register(LabelImageCell.self, forCellWithReuseIdentifier: "\(LabelImageCell.self)")
    }()
    
    let viewModel = KnownForVM()
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        configureModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureConstraints() {
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
    
    private func configureModel() {
        viewModel.success = { [weak self] in
            self?.collection.reloadData()
        }
        viewModel.errorHandler = { errorMessage in
            print("Error: \(errorMessage)")
        }
    }
}

extension KnownForVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LabelImageCell.self)", for: indexPath) as! LabelImageCell
        cell.configure(data: viewModel.data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 280)
    }
}
