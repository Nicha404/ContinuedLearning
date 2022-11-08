//
//  MultipleSheetsBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/21.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    @State var selectedModel: RandomModel? = nil
    
//    @State var showSheet = false
//    @State var showSheet2 = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<20) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in // sheet을 쓸 오브젝트가 정말 많으면 item, 그냥 2, 3개 정도이면 밑에 .sheet붙여줌(밑에처럼)
                NextScreen(selectedModel: model)
            }
        }
        
        
        
        
        
        //        VStack(spacing: 20) {
        //            Button("Button 1") {
        //                showSheet.toggle()
        //            }
        //            .sheet(isPresented: $showSheet) { // view hiearchy마다 sheet은 하나씩만, VStack보다 sheet modifer가 먼저 발동된다.
        //                NextScreen(selectedModel: RandomModel(title: "One"))
        //            }
        //
        //            Button("Button 2") {
        //                showSheet2.toggle()
        //            }
        //            .sheet(isPresented: $showSheet2) {
        //                NextScreen(selectedModel: RandomModel(title: "Two"))
        //            }
        //        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
