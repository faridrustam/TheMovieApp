//
//  HorizontalCell.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 25.02.25.
//

import UIKit

class HorizontalCell: UITableViewCell {
    
    //MARK: UI Elements
    
    private lazy var image: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private lazy var title: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 17, weight: .bold)
        l.numberOfLines = 0
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUI() {
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
    }
    
    private func configureConstraints() {
        [image, title].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 180),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    func configure(data: LabelImageCellProtocol) {
        title.text = "\(data.titleText)"
        image.loadImage(url: data.imageURL)
    }
}
