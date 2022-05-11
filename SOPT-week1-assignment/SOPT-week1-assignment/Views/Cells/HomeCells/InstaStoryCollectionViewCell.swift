//
//  InstaStoryCollectionViewCell.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/28.
//

import UIKit

class InstaStoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    static let identifier = "InstaStoryCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(dataModel: InstaStoryDataModel) {
        profileImageView.image = dataModel.profileImage
        profileNameLabel.text = dataModel.profileName
    }

}
