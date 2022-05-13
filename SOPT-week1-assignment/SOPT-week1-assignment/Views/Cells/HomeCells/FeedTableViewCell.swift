//
//  FeedTableViewCell.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/03.
//

import UIKit

protocol FeedTableViewCellDelegate: AnyObject {
    func likeDislikeFeed(_ cell: FeedTableViewCell, likeStatus: Bool)
}


class FeedTableViewCell: UITableViewCell {
    
    static let identifier = "FeedTableViewCell"

    weak var delegate: FeedTableViewCellDelegate?
    
    @IBOutlet weak var moreCommentsButton: UILabel!
//    @IBOutlet weak var feedContent: UILabel!
    
    @IBOutlet weak var likeCntLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var detailMenuButton: UIButton!
    
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameAndContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func heartBtnDidTap(_ sender: UIButton) {
        delegate?.likeDislikeFeed(self, likeStatus: !sender.isSelected)
    }
    
    
    func setFeedData(dataModel: InstaFeedDataModel) {
        
        profileImageView.image = dataModel.profileImage
        profileNameLabel.text = dataModel.profileName
        feedImageView.load(urlString: dataModel.feedImage, newWidth: UIScreen.main.bounds.width)
        profileNameAndContentLabel.text = attributeString(profileName: dataModel.profileName, feedContent: dataModel.feedContent).string
        
        likeCntLabel.text = "좋아요 \(dataModel.likeCnt)개"
//        feedContent.text = dataModel.feedContent
        moreCommentsButton.text = "댓글 \(dataModel.commentCnt)개 모두 보기"
        
    }
    
    func attributeString(profileName: String, feedContent: String) -> NSAttributedString {
        
        let profileNameFont = UIFont.systemFont(ofSize: 12, weight: .medium)
        let profileNameAttr: [NSMutableAttributedString.Key: Any] = [
            .font: profileNameFont,
        ]
        
        let contentFont = UIFont.systemFont(ofSize: 10, weight: .medium)
        let contentFontAttr: [NSMutableAttributedString.Key: Any] = [
            .font: contentFont,
        ]
        let profileNameAttributedString = NSMutableAttributedString(string: "\(profileName) ", attributes: profileNameAttr)
        
        let contentAttributedString = NSMutableAttributedString(string: "\(feedContent) ", attributes: contentFontAttr)
        
        profileNameAttributedString.append(contentAttributedString)
        
        return profileNameAttributedString
    }
}
