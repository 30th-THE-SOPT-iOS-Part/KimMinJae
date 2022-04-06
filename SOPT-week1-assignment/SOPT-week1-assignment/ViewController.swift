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
    
    var isIdTexted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        signInButton.sizeToFit()
    }
    
    @IBAction func textedId(_ sender: UITextField) {
        print("texted ID ")
        isIdTexted = true
    }
    
    @IBAction func textedPw(_ sender: Any) {
        if isIdTexted {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemBlue
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

