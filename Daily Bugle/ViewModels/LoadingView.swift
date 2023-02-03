//
//  LoadingView.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 19/01/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView()
            Text("Getting the News..")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
