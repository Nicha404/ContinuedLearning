//
//  HashableBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/23.
//
// String conforms to Hashable protocol, This create a unique id for each of these strings. 그래서 각 값들은 해쉬값을 갖는다.

import SwiftUI

struct MyCustomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct HashableBootcamp: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
