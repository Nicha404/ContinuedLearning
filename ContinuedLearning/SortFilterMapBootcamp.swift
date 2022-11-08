//
//  SortFilterMapBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/23.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let point: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // filteredArray = dataArray.sorted { $0.point < $1.point }
        filteredArray = dataArray.filter { $0.isVerified }
        
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick1", point: 1, isVerified: true)
        let user2 = UserModel(name: "Nick2", point: 2, isVerified: false)
        let user3 = UserModel(name: "Nick3", point: 3, isVerified: true)
        let user4 = UserModel(name: "Nick4", point: 4, isVerified: false)
        let user5 = UserModel(name: "Nick5", point: 5, isVerified: true)
        let user6 = UserModel(name: "Nick6", point: 6, isVerified: false)
        let user7 = UserModel(name: "Nick7", point: 7, isVerified: true)
        let user8 = UserModel(name: "Nick8", point: 8, isVerified: true)
        let user9 = UserModel(name: "Nick9", point: 9, isVerified: false)
        let user10 = UserModel(name: "Nick10", point: 10, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct SortFilterMapBootcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        HStack {
                            Text("Points: \(user.point)")
                            
                            Spacer()
                            
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.cornerRadius(10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct SortFilterMapBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SortFilterMapBootcamp()
    }
}
