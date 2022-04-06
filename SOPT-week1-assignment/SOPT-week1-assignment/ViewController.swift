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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

