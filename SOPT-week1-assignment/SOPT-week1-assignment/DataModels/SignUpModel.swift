//
//  LoginModel.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/11.
//

import Foundation

struct SignUpResoponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let id: Int
}
