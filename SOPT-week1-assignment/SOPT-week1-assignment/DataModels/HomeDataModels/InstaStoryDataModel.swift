//
//  InstaStoryDataModel.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/28.
//

import UIKit

struct InstaStoryDataModel {
    let profileName: String
    var profileImage: UIImage? {
        return UIImage(named: profileName)
    }
}

extension InstaStoryDataModel {
    static let sampleData: [InstaStoryDataModel] = [
        InstaStoryDataModel(profileName: "avatar1"),
        InstaStoryDataModel(profileName: "avatar2"),
        InstaStoryDataModel(profileName: "avatar3"),
        InstaStoryDataModel(profileName: "avatar4"),
        InstaStoryDataModel(profileName: "avatar5"),
        InstaStoryDataModel(profileName: "avatar6")
        ]
}
