//
//  InstaFeedDataModel.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/03.
//

import UIKit

struct InstaFeedDataModel {
    let profileName: String
    var profileImage: UIImage? {
        return UIImage(named: profileName)
    }
    let feedImage: UIImage?
    let likeCnt: Int
    let feedContent: String
    let commentCnt: Int
}


extension InstaFeedDataModel {
    static let sampleData: [InstaFeedDataModel] = [
        InstaFeedDataModel(profileName: "avatar1", feedImage: UIImage(named: "postImage1"), likeCnt: 30, feedContent: "🌱기회는 일어나는 것이 아니라 만들어내는 것이다.",commentCnt: 19),
        InstaFeedDataModel(profileName: "avatar2", feedImage: UIImage(named: "postImage2"), likeCnt: 330, feedContent: "⏰큰 목표를 이루고 싶으면 허락을 구하지 마라", commentCnt: 24),
        InstaFeedDataModel(profileName: "avatar3", feedImage: UIImage(named: "postImage3"), likeCnt: 130, feedContent: "🌱늘 하던 대로 하면 늘 얻던 것을 얻는다.", commentCnt: 100),
        InstaFeedDataModel( profileName: "avatar4", feedImage: UIImage(named: "postImage4"), likeCnt: 30, feedContent: "🌱놀러가고 싶다", commentCnt: 199)
        ]
}
