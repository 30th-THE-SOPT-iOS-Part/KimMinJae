//
//  StoryTableViewCell.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/03.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    static let identifier = "StoryTableViewCell"


    override func awakeFromNib() {
        super.awakeFromNib()
        storyCollectionViewRegisterNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func storyCollectionViewRegisterNib() {
        let cellIdentifier = InstaStoryCollectionViewCell.identifier
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
    }
    
    func feedTableViewRegisterNib() {
        let cellIdentifier = FeedTableViewCell.identifier
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
}

extension StoryTableViewCell: UICollectionViewDelegate {
    
}

extension StoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return InstaStoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstaStoryCollectionViewCell.identifier, for: indexPath) as? InstaStoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(dataModel: .sampleData[indexPath.row])
        return cell
    }
    
}

extension StoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 6, bottom: 8, right: 6)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        50
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
}
