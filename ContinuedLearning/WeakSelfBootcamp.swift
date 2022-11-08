//
//  WeakSelfBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/25.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    @AppStorage("count") var count: Int? // AppStorage는 View에서만 사용 가능
    
    init() {
        print("WeakSelfBootcamp Init")
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
                    .navigationTitle("Screen 1")
            }
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
            , alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currenCount = UserDefaults.standard.integer(forKey: "count") // View가 아니면 UserDefaults.
        UserDefaults.standard.set(currenCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("Deinitialize now")
        let currenCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currenCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 100) { [weak self] in
            self?.data = "New Data!" // When we had the strong reference to self we told the code that class could not be de-initialized until this async closure completes
        }
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
