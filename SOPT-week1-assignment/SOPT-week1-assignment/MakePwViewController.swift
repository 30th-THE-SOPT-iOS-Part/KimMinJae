//
//  MakePwViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/04.
//

import UIKit

class MakePwViewController: UIViewController {
    
    var userNameInPwVC: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setDescriptionLabel()
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func goToWelcomeVC(_ sender: Any) {
        guard let WelcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {
            return
        }
        
        WelcomeVC.modalPresentationStyle = .fullScreen
        WelcomeVC.modalTransitionStyle = .crossDissolve
        
        WelcomeVC.userName = userNameInPwVC
        
        // Modal - Present method
        self.present(WelcomeVC, animated: true) {
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인 정보를 입력하지 않아도 됩니다."
        descriptionLabel.sizeToFit()
    }
    

}
