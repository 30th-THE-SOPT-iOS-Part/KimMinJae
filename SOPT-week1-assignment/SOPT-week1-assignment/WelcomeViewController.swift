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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackMain(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    private func setName() {
        if let userName = userName {
            welcomeLabel.text = userName + "님이 Instagram에 오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
    

}
