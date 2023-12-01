//
//  FlowLayout.swift
//  FortniteAPI
//
//  Created by Tran Hieu on 01/12/2023.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
      
    private var previousOffset: CGFloat = 0.0
    
    private var lastOffsetCapture: Date?
    
    private var currentSpeed: CGFloat = 0
    
    override class var layoutAttributesClass: AnyClass {
        return LayoutAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        guard let collectionView = collectionView else { return attributes }
        
        let currentOffset = collectionView.contentOffset.y
        let currentTime = Date()
        
        if lastOffsetCapture == nil {
            lastOffsetCapture = Date()
            currentSpeed = 0.0
        } else {
            let interval = CGFloat(currentTime.timeIntervalSince(lastOffsetCapture!))
            let velocity = collectionView.panGestureRecognizer.velocity(in: self.collectionView)
            let speed = abs(currentOffset-previousOffset)/interval
            currentSpeed = velocity.y == 0 ? speed : 0.0
        }
        
        previousOffset = currentOffset
        lastOffsetCapture = currentTime
        
        let centreY = collectionView.bounds.size.height*3/5  - 50
        
        for att in attributes! {
            if let att = att as? LayoutAttributes {
                if currentSpeed > 2000.0 {
                    att.percentComplete = 1.0
                    continue
                }
                
                let newBoundss = max(0.0, att.center.y - collectionView.contentOffset.y)
                let percent: CGFloat = 1.0 - (newBoundss - centreY) / centreY
                att.percentComplete = max(0.0, percent)
                
                if att.percentComplete > 1.0 {
                    att.percentComplete = 1.0
                }
            }
        }
        
        return attributes
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
