import UIKit

struct LottoData: Codable {
    let datas: [Datas]
}

struct Datas: Codable {
    let drwNoDate: String
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let firstWinamnt: Int
    let firstAccumamnt: Int
    let firstPrzwnerCo: Int
    let totSellamnt: Int
}
