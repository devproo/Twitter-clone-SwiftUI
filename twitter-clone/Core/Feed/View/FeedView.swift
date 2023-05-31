//
//  FeedView.swift
//  twitter-clone
//
//  Created by ipeerless on 22/02/2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.tweets) { tweet  in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28 )
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView ) {
                NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}