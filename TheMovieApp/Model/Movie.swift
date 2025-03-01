//
//  Model.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import Foundation

// MARK: - Welcome
struct Movie: Codable {
    let dates: Dates?
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct MovieResult: Codable, LabelImageCellProtocol {
    var titleText: String {
        if yearText == "" {
            "\(title ?? "")"
        } else {
            "\(title ?? "") (\(String(yearText.prefix(4))))"
        }
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
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
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
    }
}
