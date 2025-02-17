//
//  SimilarMoviesCell.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 05.02.25.
//

import UIKit
import Alamofire

class SimilarMoviesCell: UICollectionViewCell {
    
    //MARK: UI Elements
    
    private lazy var similarMoviesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Similar Movies"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = .init(top: 0, left: 16, bottom: 16, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(LabelImageCell.self, forCellWithReuseIdentifier: "\(LabelImageCell.self)")
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    var data: [MovieResult] = []
    var similarDetailAction: ((MovieResult) -> Void)?
    
    //MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .clear
    }
    
    func getData(data: [MovieResult]){
        self.data = data
        print("Cell data: \(data)")
        collection.reloadData()
    }
    
    private func configureConstraints() {
        addSubview(collection)
        addSubview(similarMoviesLabel)
        
        NSLayoutConstraint.activate([
            similarMoviesLabel.topAnchor.constraint(equalTo: topAnchor),
            similarMoviesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            collection.topAnchor.constraint(equalTo: similarMoviesLabel.bottomAnchor, constant: 8),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension SimilarMoviesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LabelImageCell.self)", for: indexPath) as! LabelImageCell
        cell.configure(data: data[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        similarDetailAction?(data[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 280)
    }
}


