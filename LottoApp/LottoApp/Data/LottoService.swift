import UIKit

class LottoService {
    static let shared = LottoService()
    
    private init() {
        
    }
    
    func fetchLotto() {
        if let url = URL(string: "http://112.169.11.3:30080") {
            var request = URLRequest.init(url: url)
            
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                if let json = try? JSONDecoder().decode(LottoData.self, from: data) {
                    print(json.datas)
                }
            }.resume()
        }
    }
}

