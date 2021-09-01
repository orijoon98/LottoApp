
import UIKit

class ViewController: UIViewController {

    var lottoList = Array<Dictionary<String, Any>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottoList.removeAll()
        updateData()
    }
    
    func updateData() {
        LottoService.shared.fetchLotto { result in
            switch result {
            case .success(let lottoData): DispatchQueue.main.async {
                for i in (0...52) {
                    var curDict = Dictionary<String, Any>()
                    curDict["drwNoDate"] = lottoData.datas[i].drwNoDate
                    curDict["drwNo"] = lottoData.datas[i].drwNo
                    curDict["drwtNo1"] = lottoData.datas[i].drwtNo1
                    curDict["drwtNo2"] = lottoData.datas[i].drwtNo2
                    curDict["drwtNo3"] = lottoData.datas[i].drwtNo3
                    curDict["drwtNo4"] = lottoData.datas[i].drwtNo4
                    curDict["drwtNo5"] = lottoData.datas[i].drwtNo5
                    curDict["drwtNo6"] = lottoData.datas[i].drwtNo6
                    curDict["bnusNo"] = lottoData.datas[i].bnusNo
                    curDict["firstWinamnt"] = lottoData.datas[i].firstWinamnt
                    curDict["firstAccumamnt"] = lottoData.datas[i].firstAccumamnt
                    curDict["firstPrzwnerCo"] = lottoData.datas[i].firstPrzwnerCo
                    curDict["totSellamnt"] = lottoData.datas[i].totSellamnt
                    self.lottoList.append(curDict)
                }
                print(self.lottoList)
            }
            case .failure(_): print("error")
            }
        }
    }
}

