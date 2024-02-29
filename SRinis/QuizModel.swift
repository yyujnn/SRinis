	//
//  QuizModel.swift
//  SRinis
//
//  Created by David Jang on 2/28/24.
//

import Foundation

struct QuizModel {
    
    var name: String
    var profileImageName: String
    var quizQuestions: [QuizQuestion]
    
}



struct QuizQuestion {
    
    var question: String
    var options: [String]
    var answerIndex: Int
    
}




