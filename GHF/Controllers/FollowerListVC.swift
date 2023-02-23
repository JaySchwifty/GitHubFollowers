//
//  FollowerListVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/15/23.
//

import UIKit

class FollowerListVC: UIViewController {
   
   enum Section { case main }
   
   var username: String!
   var followers: [Follower] = []
   
   var collectionView: UICollectionView!
   var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(false, animated: true)
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configViewController()
      getFollowers()
      configCollectionView()
      configDataSource()
   }
   
   
   func configViewController() {
      view.backgroundColor = .systemBackground
      navigationController?.navigationBar.prefersLargeTitles = true
   }
   
   
   func getFollowers() {
      NetworkManager.shared.getFollowers(for: username, page: 1) { result in
         
         switch result {
            
         case .success(let followers):
            self.followers = followers
            self.updateData()
            
         case .failure(let error):
            self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok")
         }
      }
   }
   
   
   func configCollectionView() {
      collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
      view.addSubview(collectionView)
      
      collectionView.backgroundColor = .systemBackground
      collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
   }
   
   
   func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
      let width = view.bounds.width
      let padding: CGFloat = 12
      let minimumItemSpacing: CGFloat = 10
      let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
      let itemWidth = availableWidth / 3
      
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
      flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
      
      return flowLayout
   }
   
   
   func configDataSource() {
      dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
         cell.set(follower: follower)
         return cell
      })
   }
   
   
   func updateData() {
      var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
      snapshot.appendSections([.main])
      snapshot.appendItems(followers)
      DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
   }
}
