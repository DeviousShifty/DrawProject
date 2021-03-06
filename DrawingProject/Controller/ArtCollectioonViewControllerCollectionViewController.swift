//
//  ArtCollectioonViewControllerCollectionViewController.swift
//  DrawingProject
//
//  Created by Mumford, Ethan on 11/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//
// SENDER IS THE OBJECT THAT CALLS THE ACTION
import UIKit



private let reuseIdentifier = "artIdentifier"

public class ArtCollectioonViewControllerCollectionViewController: UICollectionViewController
{
    //MARK: Data members for Creativity Screen
    
    private let sectionInserts = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCS : [UIImage?] =
    {
        return [
            UIImage(named: "EthanMumfordEC"),
            UIImage(named: "EthanMumfordSW"),
            UIImage(named: "EthanMumfordMF"),
            UIImage(named: "panigale"),
            UIImage(named: "snowymountain"),
            UIImage(named: "widowmaker"),
            UIImage(named: "EthanMumfordOcto")
            ]
    }()
    private let labels : [String] =
    {
        return [
        "EthanMumfordEC",
        "EthanMumfordSW",
        "EthanMumfordMF",
        "panigale",
        "snowymountain",
        "widowmaker",
        "EthanMumfordOcto"
        ]
        
    }()
    
    //MARK: - Lifecycle
    
    
    
    
   public override func viewDidLoad() -> Void
   {
        super.viewDidLoad() //super. means go and do the parent function, then do the rest of the peasants

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
    

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return creativeCS.count
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell //! after variable force wraps
        artCell.backgroundColor = .purple
        artCell.artImage.image = creativeCS[indexPath.row] //.row is like using .get  as! makes it from boring type to my type (converter).
        artCell.artLabel.text = labels[indexPath.row]
    
        // Configure the cell
    
        return artCell
    }

    // MARK: UICollectionViewDelegate

    public func collectionView(_collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let paddingSpace = sectionInserts.left * (itemsPerRowCompact + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    
    public func collectionView(_collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInserts.left
    }
    public override func collectionView(_ _collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)
    {
        let imageView = UIImageView(image: creativeCS[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    //use to go back from full mode
    @objc
    private func dismissFullscreenImage(_sender: UITapGestureRecognizer)
    {
        _sender.view?.removeFromSuperview()
    }

    
    public func collectionView(_collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    
    {
        return sectionInserts
    }
    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
