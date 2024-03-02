//
//  LaunchView.swift
//  Srin2s
//
//  Created by David Jang on 2/28/24.
//

import SwiftUI

struct LaunchView: View {
    
    @State var numberOfShakes: CGFloat = 0
    @State var showTeamName = false
    let teamName = "스린이들"
    var showStep = 0.5
    
    public init() {
    }
    var body: some View {
        
        ZStack {
            Image("Background_Image")
                .ignoresSafeArea()
            
            VStack {
                Image("Srinis_Icon")
                    .frame(width: 240, height: 180)
                    .modifier(ShakeEffect(delta: numberOfShakes))
                    .onAppear {
                        withAnimation(.linear(duration: 2.0)) {
                            numberOfShakes = 4
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                numberOfShakes = 0
                            }
                        }
                    }.padding(.bottom, 20)
                HStack(spacing: 0) { // 문자 사이의 간격을 0으로 설정할 수 있습니다.
                    ForEach(0..<teamName.count, id: \.self) { index in
                        Text(String(teamName[teamName.index(teamName.startIndex, offsetBy: index)]))
                            .font(.custom("Cafe24Supermagic-OTF-Bold", size: 32))
                            .foregroundStyle(.white)
                            .offset(y: showTeamName ? 0 : 20)
                            .opacity(showTeamName ? 1 : 0)
                            .animation(.easeInOut(duration: 0.5).delay(Double(index) * showStep), value: showTeamName)
                    }
                }
                .onAppear() {
                    withAnimation {
                        showTeamName.toggle()
                    }
                }
            }
            .offset(y: -50)
        }
    }
}


struct ShakeEffect: AnimatableModifier {
    
    var delta: CGFloat = 0
    
    var animatableData: CGFloat {
        get { delta }
        set { delta = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: sin(delta * .pi * 2.0) * CGFloat.random(in: 1...4)))
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().preferredColorScheme(.dark)
    }
}

