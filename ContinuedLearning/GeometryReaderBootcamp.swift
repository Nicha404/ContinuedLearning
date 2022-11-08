//
//  GeometryReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/20.
//
// Geometry는 가끔씩만 써라 용량 너무 써먹음
// x값은 기기 왼쪽부터, y값은 위쪽부터
// 다른 페이지에 카테고리(최신순, 좋아요 순, 인기순), 이거는 그냥 카테고라이징

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            VStack {
                HStack {
                    ForEach(0..<20) { index in
                        GeometryReader { geometry in
                            Image("911")
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.9), radius: 6)
                                .rotation3DEffect(
                                    Angle(degrees: getPercentage(geo: geometry) * 20),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                        }
                        .frame(width: 200, height: 150)
                        .padding(5)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        //        GeometryReader { geometry in
        //            HStack(spacing: 0) {
        //                Rectangle()
        //                    .fill(Color.red)
        //                    .frame(width: geometry.size.width * 0.666)
        //
        //                Rectangle()
        //                    .fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2 // 너비 반
        let currentX = geo.frame(in: .global).midX // RoundedRectangle 중간 x값
        
        return Double(1 - (currentX / maxDistance)) // currentx가 왼쪽으로 가게되면 값이 점점 작아져 return값이 커지지만 currentx가 오른쪽으로 가게되면 maxdistance보다 값이 커져(x너비는 왼쪽 바부터 시작하니까)  return값이 결국 음수가 된다. Image가 가운데에 있으면 currentX와 maxdistance가 값이 같아져 각도가 없음.
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
