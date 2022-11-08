//
//  LongPressGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/19.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State private var isComplete = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 150))
            .foregroundColor(isComplete ? Color.mint : Color.gray)
            .onLongPressGesture(minimumDuration: 1.0) {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isComplete.toggle()
                }
            }
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
