//
//  MagnificationGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/19.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                
                Text("Chan Hee")
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Image("911")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in // value는 object의 확대값이다
                            currentAmount = value - 1
                        }
                        .onEnded { _ in // 손을 놓았을때 그 값
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
             
            HStack {
                Image(systemName: "heart.fill")
                
                Image(systemName: "text.bubble.fill")
                
                Spacer()
            }
            .padding(.horizontal)
            .font(.title)
            
            Text("My car is 911 Targa GTS.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        Text("Hello")
//            .font(.title)
//            .padding(40)
//            .background(Color.red)
//            .cornerRadius(10)
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
