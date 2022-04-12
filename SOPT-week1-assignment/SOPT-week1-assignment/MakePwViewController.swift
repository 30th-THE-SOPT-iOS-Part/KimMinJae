//
//  MakePwViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/04.
//

import UIKit

class MakePwViewController: UIViewController {
    
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwNextButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var userNameInPwVC: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setDescriptionLabel()
        initializeUI()
    }
    
    
    @IBAction func textedPw(_ sender: UITextField) {
        if pwTextField.hasText {
            pwNextButton.isEnabled = true
            pwNextButton.backgroundColor = .systemBlue
        } else {
            pwNextButton.isEnabled = false
            pwNextButton.backgroundColor = UIColor(displayP3Red: 107/255, green: 203/255, blue: 252/255, alpha: 1)
        }
    }
    
    @IBAction func goToWelcomeVC(_ sender: UIButton) {
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
    
    private func initializeUI() {
        pwNextButton.isEnabled = false
        pwTextField.setIcon(icon: UIImage(named: "ShownEye")!)
        
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인 정보를 입력하지 않아도 됩니다."
        descriptionLabel.sizeToFit()
    }
    

}
