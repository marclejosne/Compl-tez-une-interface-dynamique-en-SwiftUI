//
//  DishRowView.swift
//  TajMahal
//

import SwiftUI

// Carte d'un plat dans le menu : photo à gauche, nom, description, prix et niveau d'épice à droite
struct DishRowView: View {
    // Plat à afficher
    let dish: Dish

    var body: some View {
        HStack(spacing: 20) {
            // Photo du plat, recadrée au format de la maquette
            Image(dish.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 112, height: 86)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 8) {
                Text(dish.name)
                    .font(Font.custom("PlusJakartaSans-SemiBold", size: 14))

                Text(dish.description)
                    .font(Font.custom("PlusJakartaSans-Regular", size: 12))
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)

                // Prix à gauche, niveau d'épice à droite
                HStack {
                    Text(dish.formattedPrice)
                        .font(Font.custom("PlusJakartaSans-SemiBold", size: 12))
                    Spacer()
                    SpiceLevelView(spiceLevel: dish.spiceLevel)
                }
            }
            .foregroundStyle(Color(.darkGray))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 10)
        .padding(.trailing, 20)
        .padding(.vertical, 10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DishRowView(dish: ViewModel().apetizerArray[0])
        .padding()
        .background(Color(.systemGray6))
}
