//
//  RecommendedItem.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 23.05.2023.
//

import SwiftUI

struct RecommendedItem: View {
    @EnvironmentObject var arbuzmodel: ArbuzModel
    let image: String
    let name: String
    let typecount: String
    let price: Int
    var body: some View {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 120,height: 100)
                Text(name)
                    .font(.system(size: 12))
                Text(typecount)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                ZStack{
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.gray).opacity(0.2)
                    HStack(spacing: 30){
                        Text("\(price)")
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                    }
                }
                .frame(width: 100, height: 30)
                .onTapGesture {
                    arbuzmodel.addItem(price: price, image: image, name: name, typecount: typecount)
                    arbuzmodel.total += price
                }
            }
            .frame(width: 120)
        }
    }


//struct RecommendedItem_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendedItem()
//    }
//}
