//
//  MovieDetailHeaderCell.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 04.02.25.
//

import UIKit
import SDWebImage

class MovieDetailHeaderCell: UICollectionReusableView {
    
    //MARK: UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "1")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "The Shawshank Redemption"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "en"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "10-07-2001"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "7.5"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var languageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "globe")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var dateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        posterImage.layer.cornerRadius = 50
        posterImage.clipsToBounds = true
        posterImage.layer.masksToBounds = true
    }
    
    func callElement(backImage: String, poster: String, name: String, language: String, date: String, rating: Double) {
        backgroundImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(backImage)"))
        posterImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(poster)"))
        movieName.text = name
        languageLabel.text = language
        dateLabel.text = date
        ratingLabel.text = String(String(rating).prefix(3))
    }
    
    private func configureConstraints() {
        [
            backgroundImage,
            movieName,
            posterImage,
            languageImage,
            languageLabel,
            dateImage,
            dateLabel,
            ratingLabel,
            ratingImage
        ].forEach({ addSubview($0) })
        
        NSLayoutConstraint.activate([
            backgroundImage.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 250),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),

            posterImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            posterImage.widthAnchor.constraint(equalToConstant: 180),
            posterImage.heightAnchor.constraint(equalToConstant: 220),
            posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 80),
        
            movieName.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 12),
            movieName.centerXAnchor.constraint(equalTo: centerXAnchor),
            movieName.widthAnchor.constraint(equalToConstant: 230),
            movieName.heightAnchor.constraint(equalToConstant: 22),
            
            languageImage.leadingAnchor.constraint(equalTo: movieName.leadingAnchor, constant: -32),
            languageImage.widthAnchor.constraint(equalToConstant: 20),
            languageImage.heightAnchor.constraint(equalToConstant: 20),
            languageImage.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            
            languageLabel.leadingAnchor.constraint(equalTo: languageImage.trailingAnchor, constant: 8),
            languageLabel.centerYAnchor.constraint(equalTo: languageImage.centerYAnchor),
            
            dateImage.centerYAnchor.constraint(equalTo: languageImage.centerYAnchor),
            dateImage.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 32),
            dateImage.widthAnchor.constraint(equalToConstant: 20),
            dateImage.heightAnchor.constraint(equalToConstant: 20),
            
            dateLabel.leadingAnchor.constraint(equalTo: dateImage.trailingAnchor, constant: 8),
            dateLabel.centerYAnchor.constraint(equalTo: languageImage.centerYAnchor),
            
            ratingImage.centerYAnchor.constraint(equalTo: languageImage.centerYAnchor),
            ratingImage.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 32),
            ratingImage.widthAnchor.constraint(equalToConstant: 20),
            ratingImage.heightAnchor.constraint(equalToConstant: 20),
            
            ratingLabel.leadingAnchor.constraint(equalTo: ratingImage.trailingAnchor, constant: 8),
            ratingLabel.centerYAnchor.constraint(equalTo: languageImage.centerYAnchor),
            ])
    }
}
