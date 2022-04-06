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
    @IBOutlet weak var nameNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDescriptionLabel()
        nameNextButton.isEnabled = false
    }
    

    @IBAction func textedName(_ sender: Any) {
        if userNameTextField.hasText {
            nameNextButton.isEnabled = true
            nameNextButton.backgroundColor = .systemBlue
        } else {
            nameNextButton.isEnabled = false
            nameNextButton.backgroundColor = UIColor(displayP3Red: 107/255, green: 203/255, blue: 252/255, alpha: 1)
        }
        
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
