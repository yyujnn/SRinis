//
//  CollectionViewController.swift
//  CardListTest
//
//  Created by 박현렬 on 2/27/24.
//

import UIKit
import SwiftUI
class CollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    // MARK: - 이미지, Member 배열 선언
    let images = [UIImage(named: "JinyoungJang_Profile"), UIImage(named: "JunyoungPark_Profile"), UIImage(named: "SianLee_Profile"), UIImage(named: "HyunryeolPark_Profile"), UIImage(named: "YujinJeong_Profile")]
    let listImages = [UIImage(named: "JinyoungJang_Face"), UIImage(named: "JunyoungPark_Face"), UIImage(named: "SianLee_Face"), UIImage(named: "HyunryeolPark_Face"), UIImage(named: "YujinJeong_Face")]
    let titles = ["Title 1", "Title 2", "Title 3"]
    let subtitles = ["Title 1", "Title 2", "Title 3"]
    let members: [Member] = [JinyoungJang(),JunyoungPark(), SianLee(), HyunRyeolPark(),YujinJeong()]
    
    // 컬렉션 뷰 아웃렛 연결
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
        pageControl.numberOfPages = members.count
        pageControl.currentPage = 0
        print("\(pageControl.currentPage)")
        print("\(pageControl.numberOfPages)")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
               imageView.isUserInteractionEnabled = true
               imageView.addGestureRecognizer(tapGesture)
        imageView.image = UIImage(named: "CellSwitch_Card")

        if let backgroundImage = UIImage(named: "Background_Image") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        collectionView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        collectionView2.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    }
    var isToggled = false
    // MARK: - 이미지 뷰 터치 이벤트
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
            if isToggled {
                imageView.image = UIImage(named: "CellSwitch_Card")
                collectionView.isHidden = false
                collectionView2.isHidden = true
                pageControl.isHidden = false
            } else {
                imageView.image = UIImage(named: "CellSwitch_List")
                collectionView.isHidden = true
                collectionView2.isHidden = false
                pageControl.isHidden = true
            }
            isToggled = !isToggled
        }
    // MARK: - CollectionView Index Count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 분기처리
        if collectionView == self.collectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                let member = members[indexPath.item]
                cell.imageView.image = images[indexPath.item]
                cell.titleLabel.text = member.name
                cell.descriptionLabel.text = member.shortDescription
                return cell
            } else {
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
                let member = members[indexPath.item]
                cell2.imageView.image = listImages[indexPath.item]
                cell2.titleLabel.text = member.name
                cell2.descriptionLabel.text = member.shortDescription
                return cell2
            }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            return collectionView.bounds.size
        } else {
            return CGSize(width: collectionView.bounds.width, height: 100)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.bounds.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
        print(currentPage)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped Card \(indexPath.item)")
        // SwiftUI 뷰를 UIKit으로 호스팅하는 UIHostingController 생성
        let selectedMember = members[indexPath.item]
        // SwiftUI 뷰로 멤버 데이터를 전달
        let detailView = MemberDetailView(member: selectedMember)
        let hostingController = UIHostingController(rootView: detailView)

        navigationController?.pushViewController(hostingController, animated: true)
    }
}

