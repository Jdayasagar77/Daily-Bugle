//
//  NewsFetcher.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 19/01/23.
//

import Foundation

class NewsFetcher: ObservableObject {
    @Published var news = [Article]()
    @Published var errorMessage:String? = nil
    @Published var isLoading: Bool = false
    
    let service: APIServiceProtocol

    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllNews()
    }
    
    
    func fetchAllNews() {
        isLoading = true
        errorMessage = nil
        
        let service = APIService()
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=0b5daaadb04e4948b3bfc21ebaf29169")!
        service.fetchNews(url: url) { [unowned self] result in
          
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let errorMessage):
                    self.errorMessage = errorMessage.localizedDescription
                    print(errorMessage)
                case .success(let news):
                    self.news = news
            }
          
            }
        }
    }
}
