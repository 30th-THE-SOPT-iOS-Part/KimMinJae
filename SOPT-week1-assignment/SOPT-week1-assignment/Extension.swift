//
//  Extension.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/12.
//

import UIKit


extension UIViewController {
    func makeBackButton() {
        let backImage = UIImage(named: "BackArrow")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationItem.backButtonTitle = ""
    }
}

extension UITextField {
    func setIcon(icon image: UIImage) {
            let iconButton = UIButton(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
            iconButton.setImage(image, for: .normal)
            iconButton.addTarget(self, action: #selector(touchedIcon), for: .touchUpInside)
            
            let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            iconContainerView.addSubview(iconButton)
            
            rightView = iconContainerView
            rightView?.tintColor = .gray
            rightViewMode = .always
        }
        
    @objc func touchedIcon(_ sender: UIButton) {
        isSecureTextEntry ? sender.setImage(UIImage(named: "HiddenEye"), for: .normal) : sender.setImage(UIImage(named: "ShownEye"), for: .normal)
        isSecureTextEntry.toggle()
    }
    
}
