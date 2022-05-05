//
//  HomeTabViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/18.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    private func setTableView() {
        let storyNib = UINib(nibName: StoryTableViewCell.identifier, bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: StoryTableViewCell.identifier)
        
        let feedNib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
}


extension HomeTabViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let width = UIScreen.main.bounds.width
//
//        var cellHeight: CGFloat
//        switch indexPath.section {
//        case 0:
//            cellHeight = width * (80/375)
//        case 1:
//            cellHeight = width * (488/375)
//        default:
//            cellHeight = 0
//        }
//        return cellHeight
//
//    }
}

extension HomeTabViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return InstaFeedDataModel.sampleData.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            
            cell.feedModel = InstaFeedDataModel.sampleData[indexPath.row]
            cell.delegate = self
//            cell.setFeedData(dataModel: .sampleData[indexPath.row])
            
            return cell
        default:
            return UITableViewCell()
            
        }
        
    }
}

extension HomeTabViewController: FeedTableViewCellDelegate {
    func likeDislikeFeed(_ cell: FeedTableViewCell, likeStatus: Bool) {
        cell.likeButton.isSelected.toggle()
        if likeStatus == true {
            cell.feedModel?.likeCnt += 1
        } else {
            cell.feedModel?.likeCnt -= 1
        }
        
    }
}
