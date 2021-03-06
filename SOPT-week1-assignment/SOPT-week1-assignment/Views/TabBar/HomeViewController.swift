//
//  HomeTabViewController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/18.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var feedDataList = InstaFeedDataModel.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getImageList()
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


extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController: UITableViewDataSource {
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
            cell.setFeedData(dataModel: feedDataList[indexPath.row])
            cell.delegate = self
            
            return cell
        default:
            return UITableViewCell()
            
        }
        
    }
}

extension HomeViewController: FeedTableViewCellDelegate {
    func likeDislikeFeed(_ cell: FeedTableViewCell, likeStatus: Bool) {
        cell.likeButton.isSelected.toggle()
    }
}


extension HomeViewController {
    func getImageList() {
        ImageService.shared.getImageList() { response in
            switch response {
            case .success(let data):
                guard let data = data as? [ImageData] else {return}
                
                for i in 0..<InstaFeedDataModel.sampleData.count {
                    self.feedDataList[i].feedImage = data[i].download_url
                }
                self.tableView.reloadData()
            default:
                return
            }
        }
        
    }
    
}
