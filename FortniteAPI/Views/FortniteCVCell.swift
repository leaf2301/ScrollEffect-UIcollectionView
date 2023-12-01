//
//  FortniteCVCell.swift
//  FortniteAPI
//
//  Created by Tran Hieu on 30/11/2023.
//

import Foundation
import UIKit

class FortniteCVCell: UICollectionViewCell {
    
    static let id = "FortniteCVCell"
    
    let bgView = UIView()
    let bgImageView = UIImageView()
    let effectView = UIVisualEffectView()
    
    let coverView = UIView()
    let coverImageView = UIImageView()

    let nameView = UIView()
    
    let lineTopView = UIView()
    let lineBottomView = UIView()
    
    let lineRedTopView = UIView()
    let lineRedBottomView = UIView()
    
    let nameLbl = UILabel()
    let typeLbl = UILabel()
    let priceLbl = UILabel()
    let coinImageView = UIImageView()


    var indexPath: IndexPath!
    
    var bgViewLeadingConst: NSLayoutConstraint!
    var bgViewTrailingConst: NSLayoutConstraint!
    
    var nameViewLeadingConst: NSLayoutConstraint!
    var nameViewWidthConst: NSLayoutConstraint!
    var nameViewCentreConst: NSLayoutConstraint!
    
    var coverViewTrailingConst: NSLayoutConstraint!
    var coverViewWidthConst: NSLayoutConstraint!
    var coverViewCentreConst: NSLayoutConstraint!
    
    var coverImageViewWidthConst: NSLayoutConstraint!
    var coverImageViewHeightConst: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let att = layoutAttributes as! LayoutAttributes
        indexPath = att.indexPath
        
        coverView.layer.zPosition = indexPath.item % 2 == 0 ? 2 : 1
        nameView.layer.zPosition = indexPath.item % 2 == 0 ? 1 : 2
        
        layoutIfNeeded()
        if indexPath.item != 9 {
            updateBGView(att.percentComplete)
            updateNameView(att.percentComplete)
            updateCoverView(att.percentComplete)
        } else {
            UIView.animate(withDuration: 1.2) {
                self.updateBGView(0.99)
                self.updateNameView(0.99)
                self.updateCoverView(0.99)
            }
         

        }
        print(att.percentComplete)
    }
}

extension FortniteCVCell {
    private func configureCell() {
        contentView.backgroundColor = blackColor
        backgroundColor = blackColor
        
        bgView.backgroundColor = blackColor
        contentView.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        bgViewLeadingConst = bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        bgViewTrailingConst = bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)

        bgViewLeadingConst.isActive = true
        bgViewTrailingConst.isActive = true
        
        bgImageView.clipsToBounds = true
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "item")
        bgView.addSubview(bgImageView)
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        
        effectView.effect = UIBlurEffect(style: .dark)
        bgView.addSubview(effectView)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        
        //CoverView
        coverView.clipsToBounds = true
        coverView.backgroundColor = .black
        contentView.addSubview(coverView)
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        coverViewWidthConst = coverView.widthAnchor.constraint(equalToConstant: (screenWidth/2)-30)
        coverViewTrailingConst = coverView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        coverViewCentreConst = coverView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -30)
        
        coverViewWidthConst.isActive = true
        coverViewTrailingConst.isActive = true
        coverViewCentreConst.isActive = true
        
        
        //Cover Image View
        coverImageView.clipsToBounds = true
        coverImageView.image = .init(named: "item")
        coverImageView.contentMode = .scaleAspectFill
        coverView.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        coverImageViewWidthConst = coverImageView.widthAnchor.constraint(equalToConstant: screenWidth/2 - 30)
        coverImageViewHeightConst = coverImageView.heightAnchor.constraint(equalToConstant: screenWidth/2 - 30)

        coverImageViewWidthConst.isActive = true
        coverImageViewHeightConst.isActive = true

        // Name View
        nameView.backgroundColor = UIColor(hex: 0x191920)
        contentView.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false

        nameViewWidthConst = nameView.widthAnchor.constraint(equalToConstant: screenWidth/2 - 40)
        nameViewLeadingConst = nameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        nameViewCentreConst = nameView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20)

        nameViewWidthConst.isActive = true
        nameViewLeadingConst.isActive = true
        nameViewCentreConst.isActive = true
        
        
        lineTopView.clipsToBounds = true
        lineTopView.backgroundColor = .darkGray
        nameView.addSubview(lineTopView)
        lineTopView.translatesAutoresizingMaskIntoConstraints = false
        
        lineBottomView.clipsToBounds = true
        lineBottomView.backgroundColor = .darkGray
        nameView.addSubview(lineBottomView)
        lineBottomView.translatesAutoresizingMaskIntoConstraints = false
        
        lineRedTopView.clipsToBounds = true
        lineRedTopView.backgroundColor = redColor
        nameView.addSubview(lineRedTopView)
        lineRedTopView.translatesAutoresizingMaskIntoConstraints = false
        
        lineRedBottomView.clipsToBounds = true
        lineRedBottomView.backgroundColor = redColor
        nameView.addSubview(lineRedBottomView)
        lineRedBottomView.translatesAutoresizingMaskIntoConstraints = false
        

        nameLbl.font = UIFont(name: "Palatino-Bold", size: 18)
        nameLbl.text = "Tsuki"
        nameLbl.lineBreakMode = .byClipping
        nameLbl.textColor = .white
        nameLbl.numberOfLines = 2
        nameView.addSubview(nameLbl)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        
        typeLbl.font = UIFont(name: "Copperplate-Bold", size: 30)
        typeLbl.text = "Outfit"
        typeLbl.textAlignment = .center
        typeLbl.minimumScaleFactor = 0.4
        typeLbl.adjustsFontSizeToFitWidth = true
        typeLbl.textColor = .gray.withAlphaComponent(0.1)
        nameView.addSubview(typeLbl)
        typeLbl.translatesAutoresizingMaskIntoConstraints = false

        let coinW: CGFloat = 30
        priceLbl.font = UIFont(name: "Damascus-Bold", size: 35)
        priceLbl.text = "1200"
        priceLbl.textColor = .gray
        priceLbl.textAlignment = .right
        nameView.addSubview(priceLbl)
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        priceLbl.heightAnchor.constraint(equalToConstant: coinW).isActive = true


        coinImageView.clipsToBounds = true
        coinImageView.image = UIImage(named: "coin")
        coinImageView.contentMode = .scaleAspectFit
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinImageView.widthAnchor.constraint(equalToConstant: coinW).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: coinW).isActive = true

        let priceSV = UIStackView(arrangedSubviews: [coinImageView, priceLbl])
        priceSV.spacing = 5.0
        priceSV.alignment = .center
        priceSV.distribution = .fill
        priceSV.axis = .horizontal
        nameView.addSubview(priceSV)
        priceSV.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
                    
//            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
//            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            bgView.heightAnchor.constraint(equalToConstant: screenWidth/2),
            bgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            bgImageView.topAnchor.constraint(equalTo: bgView.topAnchor),
            bgImageView.leftAnchor.constraint(equalTo: bgView.leftAnchor),
            bgImageView.rightAnchor.constraint(equalTo: bgView.rightAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor),
            
            effectView.topAnchor.constraint(equalTo: bgView.topAnchor),
            effectView.leftAnchor.constraint(equalTo: bgView.leftAnchor),
            effectView.rightAnchor.constraint(equalTo: bgView.rightAnchor),
            effectView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor),

            
            coverView.heightAnchor.constraint(equalToConstant: screenWidth/2 - 30),
                        
            coverImageView.topAnchor.constraint(equalTo: coverView.topAnchor),
            coverImageView.centerXAnchor.constraint(equalTo: coverView.centerXAnchor),
         
            
            nameView.heightAnchor.constraint(equalToConstant: screenWidth/2 - 40),
//            nameView.widthAnchor.constraint(equalToConstant: screenWidth/2 - 40),
//            nameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            nameView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
            
            lineTopView.heightAnchor.constraint(equalToConstant: 1),
            lineTopView.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 15),
            lineTopView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 15),
            lineTopView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -15),
            
            lineBottomView.heightAnchor.constraint(equalToConstant: 1),
            lineBottomView.bottomAnchor.constraint(equalTo: nameView.bottomAnchor, constant: -15),
            lineBottomView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 15),
            lineBottomView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -15),
            
            lineRedTopView.heightAnchor.constraint(equalToConstant: 3),
            lineRedTopView.topAnchor.constraint(equalTo: lineTopView.bottomAnchor, constant: 15),
            lineRedTopView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -15),
            lineRedTopView.leadingAnchor.constraint(equalTo: nameView.centerXAnchor),
            
            lineRedBottomView.heightAnchor.constraint(equalToConstant: 3),
            lineRedBottomView.bottomAnchor.constraint(equalTo: lineBottomView.topAnchor, constant: -15),
            lineRedBottomView.trailingAnchor.constraint(equalTo: nameView.centerXAnchor),
            lineRedBottomView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 15),
            
            nameLbl.topAnchor.constraint(equalTo: lineRedTopView.bottomAnchor, constant: 5),
            nameLbl.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 15),
            nameLbl.trailingAnchor.constraint(lessThanOrEqualTo: nameView.trailingAnchor, constant: -15),
            
            typeLbl.heightAnchor.constraint(equalToConstant: 55),
            typeLbl.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 15),
            typeLbl.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -15),
            typeLbl.centerXAnchor.constraint(equalTo: nameView.centerXAnchor),
            typeLbl.centerYAnchor.constraint(equalTo: nameView.centerYAnchor, constant: 12),
            
            priceSV.bottomAnchor.constraint(equalTo: lineRedBottomView.topAnchor, constant: -5),
            priceSV.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -15),

        ])
    }
    
    private func updateBGView(_ percent: CGFloat) {
        let finalLeading: CGFloat = 15.0
        let finalTrailing: CGFloat = 35
        
        let leading = bounds.size.width + finalLeading
        let trailing = bounds.size.width + finalTrailing
        
        let perLeading = finalLeading + (1-percent)*leading
        let perTrailing = finalTrailing - (1-percent)*trailing
        let isBool = indexPath.item % 2 != 0
        
        bgViewLeadingConst.constant = isBool ? perLeading : perTrailing
        bgViewTrailingConst.constant = isBool ? -perTrailing : -perLeading
    }
    
    private func updateNameView(_ percent: CGFloat) {
        let width = screenWidth/2 - 40
        let boundsW = bounds.size.width
        let boundsH = bounds.size.height
        
        if indexPath.item % 2 == 0 {
            nameViewLeadingConst.constant = 20 + (1-percent)*boundsW
            nameViewWidthConst.constant = boundsW-50-width-20 + (1-percent)*(boundsW-80)
            nameViewCentreConst.constant = -percent*20
        } else {
            nameViewLeadingConst.constant = 30 + (1-percent)*boundsW
            nameViewWidthConst.constant = width
            nameViewCentreConst.constant = (boundsH/2) - percent*(boundsH/2-45)

        }
    }

    private func updateCoverView(_ percent: CGFloat) {
        let width = screenWidth/2 - 30
        
        if indexPath.item % 2 == 0 {
            coverViewTrailingConst.constant = -(30 + (1-percent)*(-180))
            coverViewWidthConst.constant = width
            coverViewCentreConst.constant = -30 + (1-percent)*(bounds.height/2)
        } else {
            coverViewTrailingConst.constant = -(20 + (1-percent)*(bounds.width+190))
            coverViewWidthConst.constant = bounds.width*4/5
            coverViewCentreConst.constant = percent*30
        }
        
        coverImageViewWidthConst.constant = coverViewWidthConst.constant
        coverImageViewHeightConst.constant = coverViewWidthConst.constant
    }

    
}
