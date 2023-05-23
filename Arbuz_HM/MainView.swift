//
//  ArbuzDemo.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var arbuzmodel: ArbuzModel
    @State private var selectview: TapViews = .basket
    var body: some View {
        NavigationView{
            TabView(selection: $selectview){
                firstscreen
            }
            .overlay(content:{
                if arbuzmodel.podpiska{
                    withAnimation{
                        ChoiceSub()
                    }
                    }
            })
        }
        .tint(.green)
    }

        var firstscreen: some View{
            BasketView(items: arbuzmodel.items)
            .tabItem {
                    Image(systemName: "cart")
            }.tag(TapViews.basket)
        }
    }


struct ArbuzDemo_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
