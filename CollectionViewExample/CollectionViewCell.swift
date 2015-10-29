//
//  CollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Bob Pascazio on 10/27/15.
//  Copyright © 2015 Bob Pascazio. All rights reserved.
//

import UIKit

@objc protocol CustomCollectionViewCellDelegate : NSObjectProtocol {
    func starImageHit(price:Float)
    optional func blowUpiPhone()
}

class CollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var delegate:CustomCollectionViewCellDelegate?
    
    var textLabel: UILabel!
    var imageView: UIImageView!
    var imageViewStar: UIImageView!
    
    var price: Float!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Add the circle.
        imageView = UIImageView(frame: CGRect(x: 0, y: 16, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
        
        // Add the label.
        let textFrame = CGRect(x: 0, y: 32, width: frame.size.width, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
        
        // Add the star.
        imageViewStar = UIImageView(frame: CGRect(x: 0, y: 16, width: frame.size.width/2, height: frame.size.height*2/3/2))
        imageViewStar.contentMode = UIViewContentMode.ScaleAspectFit
        
        // Setup gesture recognizer.
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        recognizer.delegate = self
        recognizer.numberOfTapsRequired = 1
        imageViewStar.addGestureRecognizer(recognizer)
        imageViewStar.userInteractionEnabled = true

        // Add star to content view of cell.
        contentView.addSubview(imageViewStar)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        print("tap")
        if let delegate_ = self.delegate {
            delegate_.starImageHit(self.price)
        }
    }
    
}
