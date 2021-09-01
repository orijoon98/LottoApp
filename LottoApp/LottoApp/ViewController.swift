
import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LottoService.shared.fetchLotto()
    }
    
    
}

