//
//  Protocol.swift
//  MiniProject
//
//  Created by 정유진 on 2024/02/28.
//

import Foundation

protocol Member {
    var image: String { get }
    var name: String { get }
    var skill: String { get }
    var email: String { get }
    var mbti: String { get }
    var hobby: String { get }
    var shortDescription: String { get } // 소개글
    var isLeader: Bool { get } // 팀장 여부
    var blogURL: String { get } // 블로그 주소
    var githubURL: String { get } // 깃허브 주소
}
