//
//  SettingsView.swift
//  formularios
//
//  Created by Pedro Hamue on 12/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsFactory: SettingsFactory
    @State private var selectedOrder = SortingOrderType.alphabetical
    @State private var showPurchasedOnly = false
    @State private var maxPrice = 5 {
        didSet{
            if maxPrice > 5{
                maxPrice = 5
            }
            if maxPrice < 1{
                maxPrice = 1
            }
        }
    }
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
       
        NavigationView{
            Form{
                Section(header: Text("ORDENA LAS APPS ")){
                    Picker(selection: $selectedOrder, label: Text("Orden de las Apps")){
                        ForEach(SortingOrderType.allCases, id: \.self){ orderType in
                            Text(orderType.description)
                        }
                    }
                }
                Section(header: Text("FILTRAR APPS")){
                    //Text("Filtros")
                    Toggle(isOn:$showPurchasedOnly){
                        Text("Mostrar solo Apps compradas")
                    }
                    Stepper(onIncrement: {
                        self.maxPrice += 1
                    }, onDecrement: {
                        self.maxPrice -= 1
                    }){
                        Text("Mostrar \(String(repeating:"$",count: maxPrice)) o menos")
                    }

                }
            }
        .navigationBarTitle("Configuración")
            .navigationBarItems(leading:
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()
            },label:{
                Image(systemName: "bin.xmark")
                    .font(.title)
                    .foregroundColor(.red)
            })
            ,trailing:
            Button(action:{
                self.settingsFactory.order = self.selectedOrder
                self.settingsFactory.showPurchasedOnly = self.showPurchasedOnly
                self.settingsFactory.maxPrice = self.maxPrice
                
                self.presentationMode.wrappedValue.dismiss()
            },label:{
                Image(systemName: "checkmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.gray)
            })
            )
            
                .onAppear(){
                    self.selectedOrder = self.settingsFactory.order
                    self.showPurchasedOnly = self.settingsFactory.showPurchasedOnly
                    self.maxPrice = self.settingsFactory.maxPrice
            }
    }
    }
    }
    
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsFactory())
    }
}

