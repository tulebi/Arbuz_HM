//
//  ContentView.swift
//  Arbuz_HM
//
//  Created by Тулеби Берик on 18.05.2023.
//

import SwiftUI

struct SubscriptionView: View {
    @EnvironmentObject var arbuzmodel: ArbuzModel

    var deliveryDays: [String] = [
        "Понедельник", "Вторник", "Среда", "Четверг", "Пятница"
    ]
    
    var deliveryPeriods: [String] = [
        "Уторм", "Полдень", "Вечером"
    ]
    
    var subscriptionPeriods: [String] = [
        "Неделя", "Месяц", "Кастомный"
    ]
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "xmark")
                    .onTapGesture {
                        arbuzmodel.switcher = .main
                    }
                Spacer()
                Text("Доставка")
                    .font(.title)
                    .padding(.trailing, 120)
            }
            .padding(.horizontal,16)
            VStack {
                Picker("Delivery Day", selection: $arbuzmodel.selectedDay) {
                    ForEach(deliveryDays, id: \.self) { day in
                        Text(day)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Picker("Delivery Period", selection: $arbuzmodel.selectedDeliveryPeriod) {
                    ForEach(deliveryPeriods, id: \.self) { period in
                        Text(period)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("Адрес доставки", text: $arbuzmodel.deliveryAddress)
                    .padding()
                
                TextField("Номер телефона", text: $arbuzmodel.phoneNumber)
                    .padding()
            }
            
            Text("Период доставки")
                .font(.title)
                .padding()
            
            Picker("Subscription Period", selection: $arbuzmodel.selectedSubscriptionPeriod) {
                ForEach(subscriptionPeriods, id: \.self) { period in
                    Text(period)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Image("podpiska")
                .resizable()
                .frame(width: 390,height: 180)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.green).opacity(0.5)
                    .frame(height: 54)
                    .padding(.horizontal, 16)
                VStack{
                    Text("Заказать")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                placeOrder()
            }
                        if !isAddressValid {
                            Text("Please enter a valid delivery address.")
                                .foregroundColor(.red)
                        }
                        
                        if !isPhoneNumberValid {
                            Text("Please enter a valid phone number.")
                                .foregroundColor(.red)
                        }
                        
                    }
                }
                
                // Existing code
                
                func placeOrder() {
                    // Validate fields before placing the order
                    guard isAddressValid && isPhoneNumberValid else {
                        return
                    }
                    
                    // Implement the logic for placing the order
                }
                
                // Existing code
                
                // Out-of-stock items

                
                // Existing code
                
                // Field validation
                var isAddressValid: Bool {
                    // Implement the logic to validate the delivery address
                    // Return true if the address is valid, false otherwise
                    return !arbuzmodel.deliveryAddress.isEmpty
                }
                
                var isPhoneNumberValid: Bool {
                    // Implement the logic to validate the phone number
                    // Return true if the phone number is valid, false otherwise
                    // You can use regular expressions or other validation methods
                    return !arbuzmodel.phoneNumber.isEmpty && arbuzmodel.phoneNumber.count >= 10
                }
            }
