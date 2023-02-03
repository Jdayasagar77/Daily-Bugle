//
//  ArticleBackend.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 18/01/23.
//


import Foundation

protocol APIServiceProtocol {
    func fetchNews(url: URL?, completion: @escaping(Result<[Article], APIError>) -> Void)
}


struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Article], APIError>
    
    func fetchNews(url: URL?, completion: @escaping (Result<[Article], APIError>) -> Void) {
        completion(result)
    }
 
}























//protocol APIBuilder {
//    var completeURL: URL { get }
//    var baseUrl: URL { get }
//    var path: String { get }
//}
//
//
//
//enum NewsCategoryAPI {
//    case getNews
//    case business,entertainment,general,health,science,sports,technology
//
//}
//
//
//extension NewsCategoryAPI: APIBuilder {
//
//    var baseUrl: URL {
//        switch self {
//        case .getNews:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=")!
//
//        case .business:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=")!
//
//        case .entertainment:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=")!
//
//        case .general:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=")!
//
//        case .health:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=")!
//
//        case .science:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=")!
//
//        case .sports:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=")!
//
//        case .technology:
//            return URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=")!
//
//        }
//    }
//
//    var path: String {
//        switch self {
//        case .getNews,.business,.entertainment,.health,.science,.sports,.general,.technology:
//            return "0b5daaadb04e4948b3bfc21ebaf29169"
//
//        }
//    }
//
//    var completeURL: URL {
//        switch self {
//        case .getNews,.business,.entertainment,.health,.science,.sports,.general,.technology:
//            return URL(string: "\(self.baseUrl.appendingPathComponent(self.path))") ?? URL(string: "")!
//
//        }
//    }
//}
//

//struct NewsURLs: ArticleService {
//    func startLoad(url: URL) async -> [Article]? {
//            let task = try await URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    self.handleClientError(error)
//                    return
//                }
//                guard let httpResponse = response as? HTTPURLResponse,
//                    (200...299).contains(httpResponse.statusCode) else {
//                    self.handleServerError(response)
//                    return
//                }
//                if let mimeType = httpResponse.mimeType, mimeType == "text/html",
//                    let data = data,
//                    let string = String(data: data, encoding: .utf8) {
//                    DispatchQueue.main.async {
//                        self.webView.loadHTMLString(string, baseURL: url)
//                    }
//                }
//            }
//            task.resume()
//    }
//
//
//    static private let apiKey = "0b5daaadb04e4948b3bfc21ebaf29169"
//
//    var getNews: String = "https://newsapi.org/v2/top-headlines?country=in&apiKey=\(apiKey)"
//    var business: String = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=\(apiKey)"
//    var sports: String = "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=\(apiKey)"
//    var technology: String = "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=\(apiKey)"
//    var entertainment: String = "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=\(apiKey)"
//    var health: String = "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=\(apiKey)"
//    var general: String = "https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=\(apiKey)"
//    var science: String = "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=\(apiKey)"
//
//}
