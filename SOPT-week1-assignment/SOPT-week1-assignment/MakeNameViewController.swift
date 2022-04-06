//
//  MakeNameViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/04.
//

import UIKit

class MakeNameViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var NameVCdescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDescriptionLabel()
    }
    

    @IBAction func goToMakePwVC(_ sender: Any) {
        guard let MakePwVC = self.storyboard?.instantiateViewController(withIdentifier: "MakePwViewController") as? MakePwViewController else {
            return
        }
        
        MakePwVC.userNameInPwVC = userNameTextField.text
        
        self.navigationController?.pushViewController(MakePwVC, animated: true)
    }
    
    private func setDescriptionLabel() {
        NameVCdescriptionLabel.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에 언제든지 변경할 수 있습니다."
        NameVCdescriptionLabel.sizeToFit()
    }
    

}
