//
//  QuizData.swift
//  SRinis
//
//  Created by David Jang on 2/28/24.
//

import Foundation

struct QuizData {
    
//    let member: Member
    
    static let members = [
        QuizModel(name: "박준영", profileImageName: "JunyoungPark_Face", quizQuestions: [
            QuizQuestion(question: "사진 속 인물의 현재 표정은 어때 보이나요?", options: ["엽기적인", "실망한", "울고있는", "생각없는"], answerIndex: 3),
            QuizQuestion(question: "사진 속 인물의 MBTI는?", options: ["ISFP", "I", "INFJ!", "ESTP"], answerIndex: 2)
        ]),
        QuizModel(name: "정유진", profileImageName: "YujinJeong_Face", quizQuestions: [
            QuizQuestion(question: "사진 속 인물의 MBTI는?", options: ["ISFP", "INTJ", "ENFP", "ESTP"], answerIndex: 0),
            QuizQuestion(question: "사진 속 인물의 취미는?", options: ["책 주문하기", "책 모셔놓기", "책 읽기", "책 받쳐 놓고 라면먹기"], answerIndex: 2)
        ]),
        QuizModel(name: "이시안", profileImageName: "SianLee_Face", quizQuestions: [
            QuizQuestion(question: "사진 속 인물의 MBTI는?", options: ["ISFP", "INTJ", "INFP", "ESTP"], answerIndex: 0),
            QuizQuestion(question: "사진 속 인물의 취미는?", options: ["영하 보기", "영화 제작", "부귀영화", "영화 보기"], answerIndex: 3)
        ]),
        QuizModel(name: "박현렬", profileImageName: "HyunryeolPark_Face", quizQuestions: [
            QuizQuestion(question: "사진 속 인물의 MBTI는?", options: ["ENTJ", "COOL", "CUTE", "SEXY <- 본인요청"], answerIndex: 0),
            QuizQuestion(question: "사진 속 인물의 취미는?", options: ["넷이놀기", "독서", "쇠질", "넷플릭스"], answerIndex: 3)
        ]),
        QuizModel(name: "장진영", profileImageName: "JinyoungJang_Face", quizQuestions: [
            QuizQuestion(question: "사진 속 인물의 MBTI는?", options: ["ISFP", "INFJ", "ENFP", "ESTP"], answerIndex: 1),
            QuizQuestion(question: "사진 속 인물의 취미는?", options: ["실뜨기", "축구", "등산", "수면"], answerIndex: 2)
        ])
    ]
}
