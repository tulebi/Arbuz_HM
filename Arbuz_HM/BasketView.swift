//
//  BasketView.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

struct BasketView: View {
    let items: [Item]
    @EnvironmentObject var arbuzmodel: ArbuzModel
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Корзина")
                        .fontWeight(.bold)
                        .padding(.leading, 160)
                    Spacer()
                    Text("Очистить")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                        .onTapGesture {
                            arbuzmodel.items.removeAll()
                            arbuzmodel.total = 0
                        }
                }
                GeometryReader { g in
                    ScrollView{
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray).opacity(0.2)
                                .frame(height: 50)
                            Text("Бесплатная доставка на первый заказ")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .padding(.leading,20)
                        }
                        .padding(.horizontal, 16)
                        .listRowSeparator(.hidden)
                        ItemListView(items: arbuzmodel.items)
                            .frame(width: g.size.width - 5, height: g.size.height - 450, alignment: .center)
                        ZStack{
                            Image("podpiska")
                                .resizable()
                                .frame(width: 390,height: 180)
                        }
                        .listRowSeparator(.hidden)
                        HStack{
                            Text("Рекомендуем")
                                .fontWeight(.bold)
                                .padding(.leading,16)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            HStack{
                                RecommendedItem(image: "Apple", name: "Яблоко Айдаред", typecount: "кг", price: 600)
                                RecommendedItem(image: "milk", name: "Молоко Oдари", typecount: "шт", price: 500)
                                }
                            }
                        }
                    }
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.green).opacity(0.5)
                        .frame(height: 54)
                        .padding(.horizontal, 16)
                    VStack{
                        Text("Перейти к оплате")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("\(arbuzmodel.total) ₸" )
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                    }
                }
                .onTapGesture {
                    arbuzmodel.podpiska = true
                }
            }
        }
    }
}
//struct BasketView_Previews: PreviewProvider {
//    static var previews: some View {
//        BasketView(items: [Item])
//            .environmentObject(ArbuzModel())
//    }
//}
