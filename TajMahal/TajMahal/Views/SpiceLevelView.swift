//
//  SpiceLevelView.swift
//  TajMahal
//

import SwiftUI

// Indicateur du niveau d'épice d'un plat : 3 piments, rouges si actifs, gris sinon
struct SpiceLevelView: View {
    // Niveau d'épice à représenter
    let spiceLevel: SpiceLevel
    // Taille de chaque icône de piment
    var iconSize: CGFloat = 12

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<3, id: \.self) { index in
                // Les premiers piments (selon le niveau) sont rouges, les suivants gris
                Image(index < spiceLevel.chiliCount ? "chiliRed" : "Piment")
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize, height: iconSize)
            }
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        SpiceLevelView(spiceLevel: .light)
        SpiceLevelView(spiceLevel: .medium)
        SpiceLevelView(spiceLevel: .hot)
    }
}
