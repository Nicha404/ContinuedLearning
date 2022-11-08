//
//  MaskBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/22.
//

import SwiftUI

struct MaskBootcamp: View {
    @State var rating = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView)) // 원래는 Rectangle이었는데 starsView로 마스크를 썼다.
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundColor(rating >= index ? Color.yellow : Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
