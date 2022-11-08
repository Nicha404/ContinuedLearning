//
//  BackgroundThreadBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/23.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global().async {
            let newData = self.downloadData() // When we go to another thread we need to ensure that we still have a reference to this class which is referenced on the main thread. SO by calling self. it basically creates a strong reference to this class(downloadData() with BackgroundThreadViewModel), so it knows that this downloadData() is actually in this class here. 요약 -> class는 메인 스레드에 있는데 downloadData()를 백그라운드로 처리하기에 self를 붙여서 downloadData()가 class 안에 있다는걸 명시해줌.
            
            
            DispatchQueue.main.async { // UI 업데이트와 관련된건 무조건 main thread에서 처리되어야 한다.
                self.dataArray = newData //  Before we update the dataArray We will go back onto the main thread.
            }
        }
        
       
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for i in 0..<100 {
            data.append("\(i)")
            print(data)
        }
        
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BackgroundThreadBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootcamp()
    }
}
