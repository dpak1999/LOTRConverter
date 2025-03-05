//
//  Currency.swift
//  LOTRConverter
//
//  Created by Deepak kumar Dash on 06/03/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    var id: Currency {
        self
    }
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource {
        switch self {
            case .copperPenny: .copperpenny
            case .silverPenny: .silverpenny
            case .silverPiece: .silverpiece
            case .goldPenny: .goldpenny
            case .goldPiece: .goldpiece
        }
    }
    
    var name: String {
        switch self {
            case .copperPenny: "Copper Penny"
            case .silverPenny: "Silver Penny"
            case .silverPiece: "Silver Piece"
            case .goldPenny: "Gold Penny"
            case .goldPiece: "Gold Piece"
        }
    }
    
    
}
