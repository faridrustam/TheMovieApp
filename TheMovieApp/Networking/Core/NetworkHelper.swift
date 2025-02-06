//
//  NetworkHelper.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 01.02.25.
//

import Foundation
import Alamofire

enum EncodingType {
    case url
    case json
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://api.themoviedb.org/3"
    let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmEwZjI5YTg4ZWE1MTIwMjhkYzI3ZDU0Zjg0MWI4ZSIsIm5iZiI6MTczODMzNjM4My45NDIwMDAyLCJzdWIiOiI2NzljZTg3ZjgyMmU3ZDMyZjdiZGY3NTAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Jttye7DaQ2b4GyduSnaakS0zpkgxDwKY_CL2B3bvEWQ"]
    
    func configureURL(endpoint: String) -> String {
        return baseURL + "/" + endpoint
    }
    
    func configureSimilarURL(endpoint: String, id: Int) -> String {
        return baseURL + "/" + "movie" + "/\(id)" + "/" + endpoint
    }
}
