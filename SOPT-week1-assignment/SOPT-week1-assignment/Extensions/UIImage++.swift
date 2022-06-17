//
//  UIImage++.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/14.
//

import UIKit

extension UIImage {
    
    // 이미지 비율을 맞춰 크기를 줄이는 함수
    func resize(newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return renderImage
    }
}

