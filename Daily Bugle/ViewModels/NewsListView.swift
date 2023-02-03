//
//  NewsListView.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 19/01/23.
//

import SwiftUI

struct NewsListView: View {
    let news: [Article]
    @State private var searchText: String = ""
    var filteredNewss: [Article] {
        if searchText.count == 0 {
          return news
        } else {
            return news.filter { $0.title!.lowercased().contains(searchText.lowercased())
            }
        }
    }
    var body: some View {
        List {
            ForEach(news) { news in
                
NewsRow(article: news)
                
            }
        }
    }
}



//var body: some View {
//    NavigationView {
//        List {
//            ForEach(filteredBreeds) { breed in
//                NavigationLink {
//                    BreedDetailView(breed: breed)
//                } label: {
//                    BreedRow(breed: breed)
//                }
//
//            }
//        }
//        .listStyle(PlainListStyle())
//        .navigationTitle("Find Your Perfect Cat")
//        .searchable(text: $searchText)
//
//    }
//}
//}


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(news: [Article]())
    }
}
