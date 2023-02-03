//
//  ContentView.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 18/01/23.
//

import SwiftUI

struct ContentView: View {
  
@StateObject var newsFetcher = NewsFetcher()
    var body: some View {
        if newsFetcher.isLoading {
            LoadingView()
        }else if newsFetcher.errorMessage != nil {
            ErrorView(newsFetcher: newsFetcher)
        } else {
            NewsListView(news: newsFetcher.news)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
