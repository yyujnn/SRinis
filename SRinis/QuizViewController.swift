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
    @IBOutlet weak var profileImageView: UIImageView!
    var member: QuizModel!
    var currentQuestion: QuizQuestion!
    var buttons: [UIButton] = []
    var selectedMemberName: String? // 선택된 멤버의 이름을 저장할 속성 추가
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleView.backgroundColor = UIColor.clear
        // 배경 이미지뷰
        let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
        backgroundImg.image = UIImage(named: "Background_Image")
        // 기존 뷰에 배경 이미지뷰 추가
        self.view.addSubview(backgroundImg)
        self.view.sendSubviewToBack(backgroundImg)
        // 선택된 멤버에 대한 퀴즈 데이터만 필터링
            if let selectedMemberName = selectedMemberName,
               let memberQuizModel = QuizData.members.first(where: { $0.name == selectedMemberName }) {
                // 선택된 멤버의 프로필 이미지를 가져와서 이미지뷰에 할당
                let backgroundImageString = memberQuizModel.profileImageName
                profileImageView.image = UIImage(named: backgroundImageString)
                self.member = memberQuizModel // 선택된 멤버의 퀴즈 모델 할당
                if let question = memberQuizModel.quizQuestions.randomElement() {
                    currentQuestion = question // 랜덤 문제 선택
                    setupQuestion()
                    setupOptions()
                }
            } else {
                print("선택된 멤버의 퀴즈 데이터를 찾을 수 없습니다.")
            }
        
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
        sender.backgroundColor = UIColor(red: 173/255, green: 132/255, blue: 104/255, alpha: 1.0)
        guard let option = sender.titleLabel?.text else { return }
        checkAnswer(option)
    }
    func setupQuestion() {
        questionLabel.text = currentQuestion.question
    }
    
    func setupOptions() {
        
        buttons = [example1, example2, example3, example4]
        
        for (index, button) in buttons.enumerated() {
            if index < currentQuestion.options.count {
                button.setTitle(currentQuestion.options[index], for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
    }

    func checkAnswer(_ selectedOption: String) {
        // 선택된 옵션의 인덱스를 찾습니다.
        guard let selectedIndex = currentQuestion.options.firstIndex(of: selectedOption) else { return }
//        example1.backgroundColor = UIColor(red: 173/255, green: 132/255, blue: 104/255, alpha: 1.0)
        if selectedIndex == currentQuestion.answerIndex {
            // 정답인 경우
            let alert = UIAlertController(title: "🎊정답!🎊", message: "🥳축하합니다🥳", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.dismiss(animated: true, completion: nil) // 또는 popViewController(animated:) 사용
            }))
            present(alert, animated: true)
        } else {
            // 오답인 경우
            let alert = UIAlertController(title: "❌오답❌", message: "😔다시 시도해보세요😔", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }

    
    func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            // 추가 액션 필요 시 여기에 코드 작성
        }))
        present(alert, animated: true)
    }

}



