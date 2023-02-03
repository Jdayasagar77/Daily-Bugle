//
//  NewsRow.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 20/01/23.
//

import SwiftUI

struct NewsRow: View {
    let article: Article
    var body: some View {
        VStack{
            if article.urlToImage != nil {
                Text(article.title ?? "")
                AsyncImage(url: URL(string: article.urlToImage!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 100)
                            .clipped()
                        
                     } else if phase.error != nil {
                         
                         Text(phase.error?.localizedDescription ?? "error")
                             .foregroundColor(Color.pink)
                             .frame(width: 300, height: 100)
                     } else {
                        ProgressView()
                             .frame(width: 300, height: 100)
                     }
                    
                }
                HStack{
                    Text(article.publishedAt ?? "")
                    Spacer()
                   
                }
            
            }
        
        }
    }
}

//struct NewsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRow(article: Article(from: Decoder.self as! Decoder))
//    }
//}
