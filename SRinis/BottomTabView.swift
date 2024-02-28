//
//  BottomTabView.swift
//  CardListTest
//
//  Created by 박현렬 on 2/27/24.
//

import UIKit
class BottomTab: UITabBar{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = UIColor.white
        //MARK: -Unselected Item Color
        if let unselectedImage = UIImage(named: "BottomTabBar_Image") {
            let unselectedColor = UIColor(patternImage: unselectedImage)
            self.backgroundColor = unselectedColor
        }
        // MARK: - Selected Item Color
        if let selectedImage = UIImage(named: "Background_Image") {
            _ = UIColor(patternImage: selectedImage)
            self.selectedItem?.image = selectedImage
        }
//        let selectedImage = UIImage(named: "Background_Image")
//        self.selectionIndicatorImage = selectedImage
//        self.selectedItem?.badgeColor =
    }
}
