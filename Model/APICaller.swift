//
//  APICaller.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import Foundation


class APICaller {
    static let shared = APICaller()
    
    func getTrending(completion: @escaping (Result<MealResponse, Error>) -> Void)  {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=t") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(MealResponse.self, from: data)
                completion(.success(results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
       
    }
    func getCategory(completion: @escaping (Result<CategoryResponse, Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(CategoryResponse.self, from: data)
                completion(.success(results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    func getRecommended(completion: @escaping (Result<RecommendedResponse, Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=b") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(RecommendedResponse.self, from: data)
                completion(.success(results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    func getSearch(completion: @escaping (Result<[Search], Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=m") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(results.meals))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func getFavourite(completion: @escaping (Result<[Favourite], Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=s") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(FavouriteResponse.self, from: data)
                completion(.success(results.meals))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    func getSearch(with query: String, completion: @escaping (Result<[Favourite], Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(FavouriteResponse.self, from: data)
                completion(.success(results.meals))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    
    
    

    
}
