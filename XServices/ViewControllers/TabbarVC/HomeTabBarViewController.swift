//
//  HomeTabBarViewController.swift
//  XServices
//
//  Created by K Saravana Kumar on 28/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //CollectionView
    @IBOutlet weak var browseByCatagoryCollectionView: UICollectionView!
    @IBOutlet weak var weeklyFeaturedCollectionView: UICollectionView!
    @IBOutlet weak var searchForServicesTxt: UITextField!
    
    let image =  ["faceBookLogo" , "googlePlusLogo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: searchForServicesTxt.frame.size.height))
        searchForServicesTxt.leftView = paddingView
        searchForServicesTxt.leftViewMode = .always
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == weeklyFeaturedCollectionView {
            
            return 1
        }
        return 1
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == weeklyFeaturedCollectionView {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeeklyFeaturedCollectionViewCell", for: indexPath as IndexPath) as! WeeklyFeaturedCollectionViewCell
            
            
            
            return cell
        }
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowseCatagoryCollectionViewCell", for: indexPath as IndexPath) as! BrowseCatagoryCollectionViewCell
        
        
        
        return cell
        
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
