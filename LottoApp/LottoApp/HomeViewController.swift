
import UIKit

class HomeViewController: UIViewController {
    
    var lottoList = Array<Dictionary<String, Any>>() {
        didSet {
            if lottoList.count == 53 {
                updateLabel()
            }
        }
    }
    
    @IBOutlet weak var drwNo: UILabel!
    @IBOutlet weak var drwtNo1: UILabel!
    @IBOutlet weak var drwtNo2: UILabel!
    @IBOutlet weak var drwtNo3: UILabel!
    @IBOutlet weak var drwtNo4: UILabel!
    @IBOutlet weak var drwtNo5: UILabel!
    @IBOutlet weak var drwtNo6: UILabel!
    @IBOutlet weak var bnusNo: UILabel!
    @IBOutlet weak var drwNoDate: UILabel!
    @IBOutlet weak var firstPrzwnerCo: UILabel!
    @IBOutlet weak var firstAccumamnt: UILabel!
    @IBOutlet weak var firstWinamnt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numList = [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo]
        for num in numList {
            num!.layer.masksToBounds = true
            num!.layer.cornerRadius = num!.bounds.width / 2
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lottoList.removeAll()
        updateData()
    }
    
    func updateLabel(){
        let numList = [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo]
        let numListStr = ["drwtNo1", "drwtNo2", "drwtNo3", "drwtNo4", "drwtNo5", "drwtNo6", "bnusNo"]
        drwNo.text = String(lottoList[52]["drwNo"] as! Int) + "회 당첨번호"
        let attributedStr = NSMutableAttributedString(string: drwNo.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.black, range: (drwNo.text! as NSString).range(of: "당첨번호"))
        drwNo.attributedText = attributedStr
        for i in (0...6) {
            let n = lottoList[52][numListStr[i]]!
            let N = n as! Int
            numList[i]!.text = String(N)
            if N >= 1 && N <= 10 {
                numList[i]!.backgroundColor = UIColor.systemYellow
            }
            else if N >= 11 && N <= 20 {
                numList[i]!.backgroundColor = UIColor.systemBlue
            }
            else if N >= 21 && N <= 30 {
                numList[i]!.backgroundColor = UIColor.systemRed
            }
            else if N >= 31 && N <= 40 {
                numList[i]!.backgroundColor = UIColor.systemGray
            }
            else {
                numList[i]!.backgroundColor = UIColor.systemGreen
            }
        }
        drwNoDate.text = (lottoList[52]["drwNoDate"] as! String) + " 추첨"
        firstAccumamnt.text = String(lottoList[52]["firstAccumamnt"] as! Int) + " 원"
        firstPrzwnerCo.text = "1등 " + String(lottoList[52]["firstPrzwnerCo"] as! Int) + "게임 총 당첨금액"
        firstWinamnt.text = String(lottoList[52]["firstWinamnt"] as! Int) + " 원"
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
            }
            case .failure(_): print("error")
            }
        }
    }
}
