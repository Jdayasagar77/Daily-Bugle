//
//  ErrorView.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 19/01/23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var newsFetcher = NewsFetcher()
    
    var body: some View {
        VStack{
            Text("😿")
                .font(.system(size: 80))
            
            Text(newsFetcher.errorMessage ?? "")
            
            Button {
                newsFetcher.fetchAllNews()
            } label: {
                Text("Try again ")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
