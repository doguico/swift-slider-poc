//
//  ViewController.swift
//  swift-slider-poc
//
//  Created by Guido Corazza on 11/8/17.
//  Copyright © 2017 Guido Corazza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray = [UIImage(named: "beach-1"), UIImage(named: "beach-2"), UIImage(named: "beach-3"), UIImage(named: "beach-4"), UIImage(named: "beach-5")]
    var namesArray = ["El Emir", "Los dedos", "Cabo Polonio", "Zorba", "Bikini beach"]
    
    @IBOutlet weak var selectedBeach: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let mainRect: CGRect = view.bounds
//        let mainWidth: CGFloat = mainRect.size.width
//        let mainHeight: CGFloat = mainRect.size.height
//
//        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        flowLayout.minimumLineSpacing = 0
//        flowLayout.itemSize = CGSize(width: mainWidth/2, height: mainWidth/3)
//        flowLayout.scrollDirection = .horizontal
//        self.collectionView.collectionViewLayout = flowLayout;

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeachCollectionViewCell.identifier, for: indexPath) as? BeachCollectionViewCell else {
            fatalError("Retrieved cell is not instance of BeachCollectionViewCell")
        }
        
        cell.beachImage.image = imageArray[indexPath.row]
        cell.beachName.text = namesArray[indexPath.row]
        
        cell.bounds = CGRect(x: cell.bounds.minX, y: cell.bounds.minY, width: cell.bounds.width, height: self.collectionView.bounds.height)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedBeach.image = imageArray[indexPath.row]
    }

}

