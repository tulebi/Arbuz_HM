//
//  SearchView.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

struct SwitchView: View {
    @EnvironmentObject var arbuzmodel: ArbuzModel
    var body: some View {
        switch arbuzmodel.switcher {
        case .main:
            MainView()
        case .subscription:
            SubscriptionView()
        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
