//
//  ArbuzModel.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

enum TapViews{
    case home
    case search
    case basket
}

enum Switcher{
    case main
    case subscription
}

struct Item: Identifiable {
    let id = UUID()
    let price: Int
    let image: String
    let name: String
    let typecount: String

}

class ArbuzModel: NSObject, ObservableObject{
    @Published var total: Int = 0
    @Published var items: [Item] = []
    @Published var quantity: Int = 1
    @Published var price: Int = 0
    @Published var podpiska: Bool = false
    @Published var switcher: Switcher = .main
    @Published  var selectedDay: String = ""
    @Published  var selectedDeliveryPeriod: String = ""
    @Published  var deliveryAddress: String = ""
    @Published  var phoneNumber: String = ""
    @Published  var selectedSubscriptionPeriod: String = ""

    func addItem(price: Int, image: String, name: String, typecount: String) {
        let newItem = Item(price: price, image: image, name: name, typecount: typecount)
            items.append(newItem)
        }

}
