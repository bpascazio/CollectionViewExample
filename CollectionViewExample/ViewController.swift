//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Bob Pascazio on 10/27/15.
//  Copyright © 2015 Bob Pascazio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, CustomCollectionViewCellDelegate {

    @IBOutlet weak var overlayView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var overlayLabel: UILabel!
    
    var purchaseCount:Float = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 25, bottom: 50, right: 25)
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView!.collectionViewLayout = layout
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.blackColor()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.text = "$\(indexPath.row).00"
        cell.price = Float(indexPath.row)
        cell.imageView?.image = UIImage(named: "circle")
        cell.imageViewStar?.image = UIImage(named: "star")
        cell.delegate = self
        return cell
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: CustomCollectionViewCellDelegate
    
    func starImageHit(price:Float) {
        print("star image hit in view controller")
        self.purchaseCount = self.purchaseCount + price
        self.overlayView.hidden = false
        self.overlayView.alpha = 1.0
        self.overlayLabel.text = "\(self.purchaseCount)"
       UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.overlayView.alpha = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

