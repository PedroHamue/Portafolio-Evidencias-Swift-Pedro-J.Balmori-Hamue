//
//  TransactionView.swift
//  P3 AppleWallet
//
//  Created by Pedro Hamue on 27/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
            Text("Historial de Transacciones")
                .font(.system(size:20,weight: .black, design: .rounded))
                Spacer()
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:20){
                ForEach(transactions){ t in
                    TransactionHistoryView(transaction: t)
                    }
                }.padding()
            }
        }
        
    }
}
struct TransactionHistoryView: View{
    var transaction: Transaction
    var body: some View{
        
        RoundedRectangle(cornerRadius:25)
            .foregroundColor(.green)
            .overlay(
        VStack{
            Text(transaction.date)
                .font(.system(.body,design: .rounded))
                .padding(.top)
            Image(systemName: transaction.icon)
                .font(.system(size:40))
                .foregroundColor(.white)
            .padding()
            Text(transaction.seller)
                .font(.system(.title,design:.rounded))
            .bold()
            Text("$\(String(format: "%.2f",transaction.amount))")
                .font(.system(.largeTitle,design: .rounded))
            .bold()
                .padding(.bottom)
            Spacer()
        }
      
    )  .frame(width: 220, height: 220)
    }
}
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TransactionView()
            TransactionHistoryView(transaction: transactions [0]).previewLayout(.sizeThatFits)
        }
        
    }
}
