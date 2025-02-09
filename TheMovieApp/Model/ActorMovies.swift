//
//  ActorMovies.swift
//  MovieApp
//
//  Created by Mac on 08.02.25.
//

import Foundation

// MARK: - ActorMovies
struct ActorMovies: Codable {
    let cast, crew: [Cast]?
    let id: Int?
}

// MARK: - Cast
struct Cast: Codable, LabelImageCellProtocol {
    var titleText: String {
        "\(title ?? "") (\(String(yearText.prefix(4))))"
    }
    
    var yearText: String {
        releaseDate ?? ""
    }
    
    var imageURL: String {
        posterPath ?? ""
    }
    
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department, job: String?

    var image: String {
        posterPath ?? ""
    }
    
    var movieName: String {
        originalTitle ?? ""
    }
    
    var rating: Double {
        voteAverage ?? 0
    }
    
    var overviewText: String {
        overview ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

