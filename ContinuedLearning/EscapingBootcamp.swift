//
//  EscapingBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/25.
//
// 비동기적으로 반환 값을 처리하는 방법

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text = "Hello"
    
    func getData() {
//        let newData = downloadData()
//        text = newData
        
//        downloadData2 { data -> Void in // Parameters -> Return Type in
//            text = data // $0
//        }
        
        downloadData5 { [weak self] returnedResult in // 이 클로저는 즉시 실행되지 않고 2.0초가 지나야 실행된다(escaping)
            self?.text = returnedResult.data // Strong reference로 할 때 - 우리가 비동기 작업을 처리하고 이 클로저로 돌아왔을 때 class가 살아있어야 하니까 strong reference로 묶어주는 것이다. 100초 뒤 작업이 완료되었는데 사용자가 다른 화면으로 나갔다와서 deinit이 되어버리면 안되니까.
        }
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
//    func downloadData2() -> String { // When we have regular return they want to return immediately, This is synchronous code. But When we put the asynchronous code inside, It doesn't work.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Asyncronous code
//            return "New data"
//        }
//    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data!!") // completionHanler를 호출하면 (_ data: String) -> Void) 이 함수가 실행되고 이 함 수는 18번 줄에 있는 { }이다.
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!!!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!!!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> Void

struct EscapingBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
