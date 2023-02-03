//
//  ArticleService.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 19/01/23.
//

import Foundation

//protocol ArticleService {
//    func startLoad(url: URL) async -> [Article]?
//}

struct APIService: APIServiceProtocol {

    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>)->Void) {
        guard let url = url
        else{
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }
           else if let response = response as? HTTPURLResponse, !(201...299).contains(response.statusCode) {
               completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
               
           }
           else if let data = data {
               let decoder = JSONDecoder()

                do{
                    let articles = try decoder.decode(NewsAPI.self, from: data)
                    completion(Result.success((articles.articles as? T)!))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
               
            }
        }
        task.resume()
    }

    func fetchNews(url: URL?, completion: @escaping(Result<[Article], APIError>)-> Void)  {
            guard let url = url
            else{
                let error = APIError.badURL
                completion(Result.failure(error))
                return
            }
        
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                if let error = error as? URLError {
                    completion(Result.failure(APIError.url(error)))
                }
               else if let response = response as? HTTPURLResponse, (201...299).contains(response.statusCode) {
                   completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                   
               }
               else if let data = data {
                   let decoder = JSONDecoder()

                    do{
                        let articles = try decoder.decode(NewsAPI.self, from: data)
                        completion(Result.success(articles.articles!))
                    } catch {
                        completion(Result.failure(APIError.parsing(error as? DecodingError)))
                    }
                   
                }
            }
            task.resume()
        
    }
}
