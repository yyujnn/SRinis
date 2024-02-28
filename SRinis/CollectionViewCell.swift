//
//  CollectionViewCell.swift
//  CardListTest
//
//  Created by 박현렬 on 2/27/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        titleLabel.font = UIFont(name: "NanumGothicCoding-Bold", size: 22)
        descriptionLabel.font = UIFont(name: "NanumGothicCoding", size: 20)
    }
}
