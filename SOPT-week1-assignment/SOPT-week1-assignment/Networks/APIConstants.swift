//
//  APIConstants.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/11.
//

import Foundation

/*
 API Constants
 
 - 주소를 모아놓은 구조체
 - 이름은 형식상 API를 모아 놓았다는 느낌으로 APIConstants라고 지음
 
 */

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    // loginURL = "http://13.124.62.236/auth/signin"
    static let loginURL = baseURL + "/auth/signin"
    
    // signUpURL = "http://13.124.62.236/auth/signin"
    static let signUpURL = baseURL + "/auth/signup"

    // ImageURL = "https://picsum.photos/v2/list?page=1&limit=4"
    static let imageURL = "https://picsum.photos/v2/list"
}
