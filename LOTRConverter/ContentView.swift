//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Deepak kumar Dash on 03/03/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            // Bg image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Curreny exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(
                                reason: .actionPerformed
                            )
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(
                                reason: .actionPerformed
                            )
                        }
                        
                        // Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            .task {
                try? Tips.configure()
            }
            .onChange(of: leftAmount) {
                if leftTyping {
                    rightAmount = leftCurrency.convert(
                        leftAmount,
                        to: rightCurrency
                    )
                }
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = rightCurrency.convert(
                        rightAmount,
                        to: leftCurrency
                        
                    )
                }
            }
            .onChange(of: leftCurrency) {
                leftAmount = rightCurrency.convert(
                    rightAmount,
                    to: leftCurrency
                )
            }
            .onChange(of: rightCurrency) {
                rightAmount = leftCurrency.convert(
                    leftAmount,
                    to: rightCurrency
                )
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(
                    topCurrency: $leftCurrency,
                    bottomCurrency: $rightCurrency
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
