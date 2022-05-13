//
//  ImageModel.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/13.
//

import Foundation

typealias ImageResponse = [ImageData]

struct ImageData: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}
