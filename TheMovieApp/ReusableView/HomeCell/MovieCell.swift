//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    //MARK: UI Elements
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        movieImageView.layer.cornerRadius = 20
        movieImageView.clipsToBounds = true
    }
    
    private func configureConstraints() {
        addSubview(movieImageView)
        addSubview(movieNameLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 168),
            movieImageView.heightAnchor.constraint(equalToConstant: 240),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            movieNameLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieNameLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor)
            ])
    }
    
    func configure(movieName: String, year: String, movieImage: String) {
        movieNameLabel.text = "\(movieName) (\(year))"
        movieImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(movieImage)"))
    }
}
