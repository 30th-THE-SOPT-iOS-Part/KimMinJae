//
//  TabBarController.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/04/18.
//

import UIKit

class InstaTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTBCItemColor()
        setTabBarController()
    }
    
    private func setTBCItemColor() {
        self.tabBar.unselectedItemTintColor = .black
    }
    
    func setTabBarController() {
        guard let homeVC = UIStoryboard(name: Const.Storyboard.HomeTab, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.HomeTab) as? HomeTabViewController,
              let searchVC = UIStoryboard(name: Const.Storyboard.SearchTab, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.SearchTab) as? SearchTabViewController,
              let reelsVC = UIStoryboard(name: Const.Storyboard.ReelsTab, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.ReelsTab) as? ReelsTabViewController,
              let shopVC = UIStoryboard(name: Const.Storyboard.ShopTab, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.ShopTab) as? ShopTabViewController,
              let profileVC = UIStoryboard(name: Const.Storyboard.ProfileTab, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.ProfileTab) as? ProfileTabViewController
        else { return }
        
        
        homeVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Const.ImageAssets.home,
            selectedImage: Const.ImageAssets.selectedHome
        )
        
        searchVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Const.ImageAssets.search,
            selectedImage: Const.ImageAssets.selectedSearch
        )
        
        reelsVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Const.ImageAssets.reels,
            selectedImage: Const.ImageAssets.selectedReels
        
        )
        
        shopVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Const.ImageAssets.shop,
            selectedImage: Const.ImageAssets.selectedShop
        )
        
        profileVC.tabBarItem = UITabBarItem(
            title: nil,
            image: Const.ImageAssets.profile,
            selectedImage: Const.ImageAssets.selectedProfile
        )
        
        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
    }
    

}
