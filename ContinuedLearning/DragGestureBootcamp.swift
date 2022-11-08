//
//  DragGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/19.
//

import SwiftUI

struct DragGestureBootcamp: View {
    @State private var offset: CGSize = CGSize(width: 0, height: 0) // .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width), \(offset.height)")
                
                Spacer()
            }
            .padding()
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 300)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        
        return 1.0 - min(percentage, 0.5)
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        
        return percentage * maxAngle
    }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
