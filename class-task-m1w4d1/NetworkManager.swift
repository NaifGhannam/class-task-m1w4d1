import Foundation
import Alamofire
import Combine

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    @Published var articles: [Article] = []
    @Published var isFetching: Bool = false

    private var currentPage = 1
    private let session: Session

    init() {
        let interceptor = NetworkInterceptor()
        self.session = Session(interceptor: interceptor)
    }

    func fetchNews() {
        guard !isFetching else { return }

        let url = "https://newsapi.org/v2/everything?q=apple&page=\(currentPage)"
        isFetching = true

        session.request(url).responseDecodable(of: NewsResponse.self) { [weak self] response in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch response.result {
                case .success(let data):
                    self.articles.append(contentsOf: data.articles)
                    self.currentPage += 1
                case .failure(let error):
                    print("Failed to fetch news: \(error.localizedDescription)")
                }
                self.isFetching = false
            }
        }
    }
}
