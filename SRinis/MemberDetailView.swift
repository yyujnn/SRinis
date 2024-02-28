//
//  ContentView.swift
//  Srin2s
//
//  Created by David Jang on 2/26/24.
//

import SwiftUI
import UIKit
struct MemberDetailView: View {
    
    
    var body: some View {
        
        // 화면영역 분할
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    ProfileImage()
                        .background(Color(red: 238 / 255, green: 232 / 255, blue: 220 / 255))
                        .frame(height: geometry.size.height / 2)
                        .frame(height: geometry.size.height / 2)
                    
                    QuizButton()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
                
                ZStack {
                    MembersProfile()
                        .frame(height: geometry.size.height / 2)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 153 / 255, green: 165 / 255, blue: 130 / 255))
                                .edgesIgnoringSafeArea(.all))
                    FloatingButton()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
            }
        }
    }
}

#Preview {
    MemberDetailView()
}

struct ProfileImage: View {
    var body: some View {
        
        Image("profileImage")
            .background(Color(red: 238 / 255, green: 232 / 255, blue: 220 / 255))
            .scaledToFit()
            .padding(.top, 60)
    }
}

struct MembersProfile: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("장진영")
                .padding(.top, 32)
                .font(.custom("NanumGothicCoding-Bold", size: 22))
                .shadow(radius: 10)
            
            Text("mgynsz@gmail.com")
                .padding(.top, -5)
                .font(.custom("NanumGothicCoding", size: 17))
                .shadow(radius: 10)

            HStack {
                Text("스킬")
                    .frame(width: 60, alignment: .leading)
                    .font(.custom("NanumGothicCoding-Bold", size: 22))
                    .shadow(radius: 10)
                
                Text("Swift")
                    .font(.custom("NanumGothicCoding", size: 17))
                    .shadow(radius: 10)
            }
            .padding(.top, 8)

            HStack {
                Text("MBTI")
                    .frame(width: 60, alignment: .leading)
                    .font(.custom("NanumGothicCoding-Bold", size: 22))
                    .shadow(radius: 10)
                
                Text("INFJ")
                    .font(.custom("NanumGothicCoding", size: 17))
                    .shadow(radius: 10)
            }
            .padding(.top, 8)
            
            HStack {
                Text("취미")
                    .frame(width: 60, alignment: .leading)
                    .font(.custom("NanumGothicCoding-Bold", size: 22))
                    .shadow(radius: 10)
                
                Text("백패킹, 등산, 자전거")
                    .font(.custom("NanumGothicCoding", size: 17))
                    .shadow(radius: 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
            
            Text("간단한 한마디")
                .padding(.top, 8)
                .font(.custom("NanumGothicCoding-Bold", size: 22))
                .shadow(radius: 10)
            
            Text("내일배움캠프 3기 화이팅!!!")
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
    
    var body: some View {
        
        
        VStack(alignment: .trailing) {
            if isPressed {
                Button(action: {
                    openURL("https://velog.io/@mgynsz")
                }) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 32)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "b.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        )
                }
                
                Button(action: {
                    openURL("https://github.com/mgynsz")
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .padding(.horizontal, 32)
                        .shadow(radius: 10)
                        .overlay(
                            Image("git")
                                .resizable()
                                .scaledToFit()
                                .font(.largeTitle)
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
                            .font(.largeTitle)
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
                MyViewControllerRepresentable()
            }
        }
    }
    func toggleLight() {

    }
}
struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> QuizViewController {
        let storyboard = UIStoryboard(name: "Quiz", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        return viewController
    }

    func updateUIViewController(_ uiViewController: QuizViewController, context: Context) {
        // 뷰 컨트롤러를 업데이트하는 코드를 작성합니다.
    }
}
