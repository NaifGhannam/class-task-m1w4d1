import SwiftUI

struct NewsView: View {
    @StateObject private var networkManager = NetworkManager.shared

    var body: some View {
        NavigationView {
            List {
                ForEach(networkManager.articles) { article in
                    Text(article.title)
                }

                if networkManager.isFetching {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    Button("Load More") {
                        networkManager.fetchNews()
                    }
                }
            }
            .navigationTitle("News")
            .onAppear {
                if networkManager.articles.isEmpty {
                    networkManager.fetchNews()
                }
            }
        }
    }
}
