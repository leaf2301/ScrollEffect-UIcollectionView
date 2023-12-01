//
//  LayoutAttributes.swift
//  FortniteAPI
//
//  Created by Tran Hieu on 01/12/2023.
//

import UIKit

class LayoutAttributes: UICollectionViewLayoutAttributes {
    
    var percentComplete: CGFloat = 0.0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let attr = super.copy(with: zone) as! LayoutAttributes
        attr.percentComplete = percentComplete
        return attr
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        let attr = object as! LayoutAttributes
        return attr.percentComplete == percentComplete ? super.isEqual(object) : false
        
     }
}
