//
//  WelcomeViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/04.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
    }
    
    @IBAction func loginWithAnotherID(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    private func setName() {
        if let userName = userName {
            welcomeLabel.text = "\(userName)님, Instagram에 오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
    

    @IBAction func moveToMainScreen(_ sender: UIButton) {
        signUp()
//        guard let mainScreen = UIStoryboard(name: Const.Storyboard.TabBar, bundle: nil).instantiateViewController(withIdentifier: Const.TabBarController.TabBar) as? InstaTabBarController else {
//            return
//        }
//
//        mainScreen.modalPresentationStyle = .fullScreen
//        mainScreen.modalTransitionStyle = .crossDissolve
//
//        self.present(mainScreen, animated: true) {
//            self.view.window?.rootViewController = mainScreen
//            self.view.window?.makeKeyAndVisible()
//        }
        
    }
}

extension WelcomeViewController {
    func signUp() {
        
        guard let emailName = userName else { return }
        guard let password = password else {return}
        
        UserService.shared.signUp(emailName: emailName, password: password) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? SignUpResoponse else { return }
                    if data.status == 201 {
                        self.alert(title: "회원가입 성공", message: nil) { _ in
                            self.dismiss(animated: true)
                        }
                    }
                case .requestErr(let data):
                    guard let data = data as? SignUpResoponse else { return }
                    self.alert(title: "회원가입 실패", message: data.message) { _ in
                        self.dismiss(animated: true)
                    }
                default:
                    return
                }
        }
        
    }
}
