//
//  Arbuz_HMApp.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

@main
struct Arbuz_HMApp: App {
    @StateObject var arbuzmodel: ArbuzModel = .init()
    var body: some Scene {
        WindowGroup {
            SwitchView()
                .environmentObject(arbuzmodel)
        }
    }
}
