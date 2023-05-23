//
//  HomeView.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

struct ChoiceSub: View {
    @EnvironmentObject var arbuzmodel: ArbuzModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            VStack(alignment: .center){
                HStack{
                    Text("Доставка")
                        .fontWeight(.bold)
                        .padding(.leading, 140)
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(.green)
                        .onTapGesture {
                            arbuzmodel.podpiska = false
                        }
                }
                .padding(.top,-30)
                .padding(.horizontal,16)
                HStack{
                    Buttons(text: "Еженедельная \nдоставка")
                        .onTapGesture {
                            arbuzmodel.switcher = .subscription
                        }
                    Buttons(text: "Только один раз")
                  }
                }
            }
            .frame(height: 150)
            .inBottomSheet()
            
        }
    }
    

    struct Buttons: View{
        //@EnvironmentObject var pomodoroModel: PomodoroModel
        let text: String
        var body: some View{
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 172, height: 60)
                Text(text)
                    .foregroundColor(.black)
            }
        }
    }
    
    fileprivate extension View {
        func inBottomSheet() -> some View {
            VStack {
                Spacer()
                self
            }
            .ignoresSafeArea()
        }
    }
    
    
    struct ChoiceSub_Previews: PreviewProvider {
        static var previews: some View {
            ChoiceSub()
        }
    }
