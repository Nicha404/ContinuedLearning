//
//  TypealiasBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/25.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    @State var item = TVModel(title: "TV", director: "emily", count: 1)
     
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
