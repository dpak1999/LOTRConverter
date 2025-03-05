//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Deepak kumar Dash on 04/03/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency

    var body: some View {
        ZStack {
            // Parchment bg image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(currency: $topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Currency icons
                IconGrid(currency: $bottomCurrency)
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency = Currency.copperPenny
    @Previewable @State var bottomCurrency = Currency.silverPenny
    
    SelectCurrency(
        topCurrency: $topCurrency,
        bottomCurrency: $bottomCurrency)
}
