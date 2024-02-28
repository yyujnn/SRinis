//
//  ListCollectionViewCell.swift
//  SRinis
//
//  Created by 박현렬 on 2/28/24.
//

import UIKit
class ListCollectionViewCell:UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var uiview: UIView!
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.uiview.layer.cornerRadius = 35
        self.uiview.layer.masksToBounds = true
    }
}
