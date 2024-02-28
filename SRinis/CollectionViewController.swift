//
//  CollectionViewController.swift
//  CardListTest
//
//  Created by 박현렬 on 2/27/24.
//

import UIKit

class CollectionViewController: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    // 이미지 배열과 텍스트 배열
    let images = [UIImage(named: "profile_Image1"), UIImage(named: "profile_Image1"), UIImage(named: "profile_Image1")]
    let titles = ["Title 1", "Title 2", "Title 3"]
    let subtitles = ["Title 1", "Title 2", "Title 3"]
    
    // 컬렉션 뷰 아웃렛 연결
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // 페이지 컨트롤 설정
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        print("\(pageControl.currentPage)")
        print("\(pageControl.numberOfPages)")
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = images[indexPath.item]
        cell.titleLabel.text = titles[indexPath.item]
        cell.descriptionLabel.text = subtitles[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.bounds.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
        print(currentPage)
    }
    
}

