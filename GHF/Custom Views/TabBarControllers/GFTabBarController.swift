//
//  GFTabBarController.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/4/23.
//

import UIKit

class GFTabBarController: UITabBarController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      UITabBar.appearance().tintColor = .systemGreen
      self.viewControllers = [createSearchNC(), createFavoritesNC()]
   }
   
   
   func createSearchNC() -> UINavigationController {
      let searchVC         = SearchVC()
      searchVC.tabBarItem  = UITabBarItem(tabBarSystemItem: .search, tag: 0)
      
      return UINavigationController(rootViewController: searchVC)
   }
   
   
   func createFavoritesNC() -> UINavigationController {
      let favoritesVC         = FavoritesListVC()
      favoritesVC.title       = "Favorites"
      favoritesVC.tabBarItem  = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
      
      return UINavigationController(rootViewController: favoritesVC)
   }

}
