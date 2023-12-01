//
//  Color.swift
//  FortniteAPI
//
//  Created by Tran Hieu on 01/12/2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex&0xFF000)>>16) / 255
        let b = CGFloat((hex&0xFF00)>>8) / 255
        let g = CGFloat(hex&0xFF) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
