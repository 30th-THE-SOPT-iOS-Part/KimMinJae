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
        initializeButton()
        makeBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 처음화면으로 돌아왔을때 초기화 위한 부분
        super.viewWillAppear(true)
        idTextField.text = ""
        pwTextField.text = ""
        loginButton.backgroundColor = UIColor(displayP3Red: 107/255, green: 203/255, blue: 252/255, alpha: 1)
    }
    
    @IBAction func textedIdAndPw(_ sender: UITextField) {
        // 삼항 연산자 활용
        loginButton.isEnabled = idTextField.hasText && pwTextField.hasText
        loginButton.backgroundColor = idTextField.hasText && pwTextField.hasText ? .systemBlue : UIColor(displayP3Red: 107/255, green: 203/255, blue: 252/255, alpha: 1)
        
    }
    
    
    @IBAction func goToMakeIdVC(_ sender: UIButton) {
        guard let MakeNameVC = UIStoryboard(name: Const.Storyboard.SignUp, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.MakeName) as? MakeNameViewController else {
            return
        }
        
        self.navigationController?.pushViewController(MakeNameVC, animated: true)
    }
    
    @IBAction func goToWelcomeVC(_ sender: UIButton) {
        
        login()
        
        
//        guard let WelcomeVC = UIStoryboard(name: Const.Storyboard.Welcome, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Welcome) as? WelcomeViewController else { return }
//
//        WelcomeVC.modalPresentationStyle = .fullScreen
//        WelcomeVC.modalTransitionStyle = .crossDissolve
//
//        WelcomeVC.userName = idTextField.text
//
//        self.present(WelcomeVC, animated: true, completion: nil)
        
    }
    
    
    private func initializeButton() {
        loginButton.isEnabled = false
        signInButton.sizeToFit()
        pwTextField.setIcon(icon: Const.ImageAssets.shownEye)
    }
}

extension ViewController {
    func login() {
        guard let name = idTextField.text else { return }
        let email = name
        guard let password = pwTextField.text else { return }
        
        UserService.shared.login(name: name, email: email, password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
                
                if data.status == 200 {
                    
                    self.alert(title: "로그인 성공", message: nil) { _ in
                        guard let homeVC = UIStoryboard(name: "HomeTab", bundle: nil).instantiateViewController(withIdentifier: "HomeTabViewController") as? HomeViewController else { return }
                        
                        homeVC.modalTransitionStyle = .crossDissolve
                        homeVC.modalPresentationStyle = .fullScreen
                        
                        self.present(homeVC, animated: true) {
                            self.view.window?.rootViewController = homeVC
                            self.view.window?.makeKeyAndVisible()
                        }
                    }
                }
            case .requestErr(let data):
                guard let data = data as? LoginResponse else { return }
                self.alert(title: "로그인 실패", message: data.message, okAction: nil)
            default:
                return
            }
        }
    }
}
