//
//  ViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        signInButton.sizeToFit()
    }
    
    @IBAction func textedIdAndPw(_ sender: UITextField) {
        if idTextField.hasText && pwTextField.hasText {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemBlue
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(displayP3Red: 107/255, green: 203/255, blue: 252/255, alpha: 1)
        }
    }
    
    
    @IBAction func goToMakeIdVC(_ sender: UIButton) {
        guard let MakeNameVC = self.storyboard?.instantiateViewController(withIdentifier: "MakeNameViewController") as? MakeNameViewController else {
            return
        }
        
        self.navigationController?.pushViewController(MakeNameVC, animated: true)
    }
    
    @IBAction func goToWelcomeVC(_ sender: Any) {
        
        guard let WelcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {
            return
        }
        
        WelcomeVC.modalPresentationStyle = .fullScreen
        WelcomeVC.modalTransitionStyle = .crossDissolve
        
        WelcomeVC.userName = idTextField.text
        
        self.present(WelcomeVC, animated: true, completion: nil)
        
        idTextField.text = ""
    }
}

