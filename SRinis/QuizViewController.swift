//
//  ViewController.swift
//  MiniProject
//
//  Created by 정유진 on 2024/02/27.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var exampleView: UIView!
    @IBOutlet weak var example1: UIButton!
    @IBOutlet weak var example2: UIButton!
    @IBOutlet weak var example3: UIButton!
    @IBOutlet weak var example4: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleView.backgroundColor = UIColor.clear
        // 배경 이미지뷰
        let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
        backgroundImg.image = UIImage(named: "backgroundImg")
        // 기존 뷰에 배경 이미지뷰 추가
        self.view.addSubview(backgroundImg)
        self.view.sendSubviewToBack(backgroundImg)
        
        
        // profileView를 동그라미 모양으로 만들기 위해 모서리를 조정
        profileView.layer.cornerRadius = profileView.frame.size.width / 2
        // 모서리 조정 후 뷰의 레이어 속성에 반영
        profileView.layer.masksToBounds = true
    
        // 각 답변 button 모서리
        example1.layer.cornerRadius = 30
        example1.layer.masksToBounds = true
        
        example2.layer.cornerRadius = 30
        example2.layer.masksToBounds = true
        
        example3.layer.cornerRadius = 30
        example3.layer.masksToBounds = true
        
        example4.layer.cornerRadius = 30
        example4.layer.masksToBounds = true
        
        // 버튼에 액션 추가
        example1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        example2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        example3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        example4.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
   
    }
    @objc func buttonTapped(_ sender: UIButton) {
        // 버튼이 탭되었을 때 실행될 코드 작성
        example1.backgroundColor = UIColor(red: 173/255, green: 132/255, blue: 104/255, alpha: 1.0)
    }

}

