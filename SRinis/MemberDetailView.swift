//
//  ContentView.swift
//  Srin2s
//
//  Created by David Jang on 2/26/24.
//

import SwiftUI
import UIKit

struct MemberDetailView: View {
    
    var member: Member
    
    var body: some View {
        
        // 화면영역 분할
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    ProfileImage(member: member)
                        .background(Color(red: 238 / 255, green: 232 / 255, blue: 220 / 255))
                        .frame(height: geometry.size.height / 2)
                        .frame(height: geometry.size.height / 2)
                    
                    QuizButton(memberName: member.name)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
                
                ZStack {
                    MembersProfile(member: member)
                        .frame(height: geometry.size.height / 2)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 153 / 255, green: 165 / 255, blue: 130 / 255))
                                .edgesIgnoringSafeArea(.all))
                    FloatingButton(member: member)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        .padding(.bottom, 16)
                }
            }
        }
    }
}

#Preview {
    MemberDetailView(member: JinyoungJang())
}

struct ProfileImage: View {
    let member: Member
    var body: some View {
        
        Image(member.image)
            .background(Color(red: 238 / 255, green: 232 / 255, blue: 220 / 255))
            .scaledToFit()
            .padding(.top, 60)
    }
}

struct MembersProfile: View {
    
    let member: Member
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(member.name)
                .padding(.top, 32)
                .font(.custom("NanumGothicCoding-Bold", size: 22))
                .shadow(radius: 10)
            
            Text(member.email)
                .padding(.top, -5)
                .font(.custom("NanumGothicCoding", size: 17))
                .shadow(radius: 10)
            
            HStack {
                Text("스킬")
                    .frame(width: 60, alignment: .leading)
                    .font(.custom("NanumGothicCoding-Bold", size: 22))
                    .shadow(radius: 10)
                
                Text(member.skill)
                    .font(.custom("NanumGothicCoding", size: 17))
                    .shadow(radius: 10)
            }
            .padding(.top, 8)
            
            HStack {
                Text("MBTI")
                    .frame(width: 60, alignment: .leading)
                    .font(.custom("NanumGothicCoding-Bold", size: 22))
                    .shadow(radius: 10)
                
                Text(member.mbti)
                    .font(.custom("NanumGothicCoding", size: 17))
                    .shadow(radius: 10)
            }
            .padding(.top, 8)
            
            HStack {
                Text("취미")
                    .frame(width: 60, alignment: .leading)
                    .font(.custom("NanumGothicCoding-Bold", size: 22))
                    .shadow(radius: 10)
                
                Text(member.hobby)
                    .font(.custom("NanumGothicCoding", size: 17))
                    .shadow(radius: 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
            
            Text("간단한 한마디")
                .padding(.top, 8)
                .font(.custom("NanumGothicCoding-Bold", size: 22))
                .shadow(radius: 10)
            
            Text(member.shortDescription)
                .padding(.top, 2)
                .font(.custom("NanumGothicCoding", size: 17))
                .shadow(radius: 10)
            Spacer()
        }
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 153 / 255, green: 165 / 255, blue: 130 / 255))
                .ignoresSafeArea(edges: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.leading)
    }
}

struct FloatingButton: View {
    
    @State private var isPressed = false
    let member: Member
    
    var body: some View {
        
        
        VStack(alignment: .trailing) {
            if isPressed {
                Button(action: {
                    openURL(member.blogURL)
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 32)
                        .shadow(radius: 10)
                        .overlay(
                            Image("Blog_Image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        )
                }
                
                Button(action: {
                    openURL(member.githubURL)
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 32)
                        .shadow(radius: 10)
                        .overlay(
                            Image("Git_Image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.red)
                        )
                }
            }
            
            Button(action: { isPressed.toggle() }) {
                Circle()
                    .fill(isPressed ? Color.white : Color(red: 248/255, green: 176/255, blue: 176/255))
                    .frame(width: 60, height: 60)
                    .shadow(radius: 10)
                    .font(.largeTitle)
                    .overlay(
                        Image(systemName: isPressed ? "xmark" : "ellipsis")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .trailing) // 여기에 추가
            .padding(.horizontal, 32)
        }
    }
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct QuizButton: View {
    
    @State private var brightness = 0.0
    @State private var isActive = false
    @State private var isPresented = false
    var memberName: String // 퀴즈를 표시할 멤버 이름 추가
    
    var body: some View {
        VStack {
            Button(action: { self.isActive = true
                self.isPresented = true }) {
                    Image(systemName: "lightbulb.fill")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                        .opacity(brightness)
                        .frame(width: 60, height: 60)
                        .background(Color(red: 238 / 255, green: 232 / 255, blue: 220 / 255))
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.yellow, lineWidth: 3)
                        )
                }
                .padding(.horizontal, 32)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        self.brightness = 1.0
                    }
                }.sheet(isPresented: $isPresented) {
                    MyViewControllerRepresentable(memberName: memberName)
                }
        }
    }
    func toggleLight() {
        
    }
}
struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    
    var memberName: String
    
    func makeUIViewController(context: Context) -> QuizViewController {
            let storyboard = UIStoryboard(name: "Quiz", bundle: Bundle.main)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {
                fatalError("QuizViewController not found")
            }
            viewController.selectedMemberName = memberName // 멤버 이름 설정
            return viewController
        }
    
    func updateUIViewController(_ uiViewController: QuizViewController, context: Context) {
        // 뷰 컨트롤러를 업데이트하는 코드를 작성합니다.
    }
}


