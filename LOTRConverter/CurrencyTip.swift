//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Deepak kumar Dash on 06/03/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change Currency")
    var message: Text? = Text("Tap left or right currency to change it.")
    var image: Image? = Image(systemName: "hand.tap.fill")  
}
