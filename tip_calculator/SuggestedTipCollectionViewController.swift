//
//  SuggestedTipCollectionViewController.swift
//  tip_calculator
//
//  Created by Maha Govindarajan on 1/31/16.
//  Copyright © 2016 Maha Govindarajan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyCell"
var labelArray = [String]()

class SuggestedTipCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Suggested Tip"
        labelArray = ["Restaurants","15- 20%","Food Delivery","15-20 % dpending on the distance","Hotel Room Service","15-20% if not included","Automotive Service", " Not expected, or a few dollars epending on the amounr","Mover","Not expected or $5, %10 or %20 depending on amount","Home Service (Plumber, Electrician etc)","Not expected or $5, %10 or %20 depending on amount","Hairstylists, Nail Service etc", "10-20%","Massage","10 - 20%","Taxi or Limo Drivers", "15 - 20%","Shuttle Drivers, Parking Attendant","$1 - $3","Tour Guides","$1 - $5 depending on the length of the tour"
        ]


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell =  collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        as! SuggestedTipCollectionViewCell
//        
//        if let theLabel = cell.contentView.viewWithTag(123) as? UILabel {
            let label = labelArray[indexPath.row]
//            theLabel.text = label
//        }
        if cell.suggestedTipLabel != nil {
        cell.suggestedTipLabel.text = label
        }
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    
        // Configure the cell
    
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
