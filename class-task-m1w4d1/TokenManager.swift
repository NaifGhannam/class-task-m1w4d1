import Foundation
import Alamofire

class TokenManager : ObservableObject {
    static let shared = TokenManager()

    // قم بإزالة الكلمة المفتاحية `private` لجعل المُنشئ `internal` (الافتراضي)
    init() {}

    func fetchToken(completion: @escaping (String?) -> Void) {
        let tokenURL = "http://127.0.0.1:8000/get-token?username=naif"

        AF.request(tokenURL).responseJSON { response in
            switch response.result {
            case .success(let data):
                if let json = data as? [String: Any],
                   let token = json["token"] as? String {
                    completion(token)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("Failed to fetch token: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
