import UIKit

enum NetworkError: Error{
    case badURL
    case noData
    case decodingError
}

class LottoService {
    static let shared = LottoService()
    
    private init() {
        
    }
    
    let url = URL(string: "http://112.169.11.3:30080")
    
    func fetchLotto(completion: @escaping (Result<LottoData, NetworkError>) -> Void) {
        guard let url = url else {
            print("badURL")
            return completion(.failure(.badURL))
        }
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data, error == nil else {
                print("noData")
                return completion(.failure(.noData))
            }
            let lottoData = try? JSONDecoder().decode(LottoData.self, from: data)
            if let lottoData = lottoData {
                completion(.success(lottoData)) } else {
                    print("decodingError")
                    completion(.failure(.decodingError))
            }
        }.resume()
    }
}

