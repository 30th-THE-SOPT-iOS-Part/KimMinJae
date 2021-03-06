//
//  InstaFeedDataModel.swift
//  SOPT-week1-assignment
//
//  Created by κΉλ―Όμ¬ on 2022/05/03.
//

import UIKit

struct InstaFeedDataModel {
    let profileName: String
    var profileImage: UIImage? {
        return UIImage(named: profileName)
    }
    var feedImage: String
    var likeCnt: Int
    let feedContent: String
    let commentCnt: Int
}


extension InstaFeedDataModel {
    static var sampleData: [InstaFeedDataModel] = [
        InstaFeedDataModel(profileName: "avatar1", feedImage: "", likeCnt: 30, feedContent: "π±κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.",commentCnt: 19),
        InstaFeedDataModel(profileName: "avatar2", feedImage: "", likeCnt: 330, feedContent: "β°ν° λͺ©νλ₯Ό μ΄λ£¨κ³  μΆμΌλ©΄ νλ½μ κ΅¬νμ§ λ§λΌ", commentCnt: 24),
        InstaFeedDataModel(profileName: "avatar3", feedImage: "", likeCnt: 130, feedContent: "π±λ νλ λλ‘ νλ©΄ λ μ»λ κ²μ μ»λλ€.", commentCnt: 100),
        InstaFeedDataModel( profileName: "avatar4", feedImage: "", likeCnt: 30, feedContent: "π±λλ¬κ°κ³  μΆλ€γγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγγμ€μ€μ€μ€μ€μ€μ€μ€μ€μ€", commentCnt: 199)
        ]
}
