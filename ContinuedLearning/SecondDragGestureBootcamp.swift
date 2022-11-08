//
//  SecondDragGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/19.
//

import SwiftUI

struct SecondDragGestureBootcamp: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.83
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            
            ExtractedView()
                .offset(y: startingOffsetY) // offset이 생길수록 그 값이 점점 더해짐
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height // translation - width, height 값
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY // 내려온 만큼 올라가야 되니까 startingoffsety에 -를 붙여서 위에서 offset끼리 더해준다.
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
            
            Text("\(currentDragOffsetY)")
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}

struct SecondDragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SecondDragGestureBootcamp()
    }
}

struct ExtractedView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding()
            
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("I can do it everthing in this world. I can be CEO and also president. I live in center garden house and my car is porsche targa GTS")
                .multilineTextAlignment(.leading)
                .padding()
            
            Text("Create an account")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
