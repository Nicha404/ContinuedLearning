//
//  CodableBootcamp.swift
//  ContinuedLearning
//
//  Created by 한찬희 on 2022/09/26.
//

import SwiftUI

struct CustomerModel: Identifiable, Decodable { // Decodable allows us to initialize a CustomModel from some sort of data and it will decode from the data into a CustomModel
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool

    enum CodingKeys: CodingKey {
        case id
        case name
        case points
        case isPremium
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
}

class CodableViewModel: ObservableObject {
    @Published  var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    }
    
    func getJSONData() -> Data? {
        let dictionary: [String: Any] = [
            "id": "12345",
            "name": "Joe",
            "points": 5,
            "isPremium": true
        ]
        let jasonData = try? JSONSerialization.data(withJSONObject: dictionary)
        
        return jasonData
    }
}

struct CodableBootcamp: View {
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
        .font(.title)
        .fontWeight(.semibold)
        .foregroundColor(.blue)
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
