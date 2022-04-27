//
//  Extension.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/12.
//

import UIKit


extension UIViewController {
    func makeBackButton() {
        let backImage = Const.ImageAssets.backArrow
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationItem.backButtonTitle = ""
    }
}
