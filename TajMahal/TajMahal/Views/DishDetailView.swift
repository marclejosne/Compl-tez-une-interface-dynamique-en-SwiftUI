//
//  DishDetailView.swift
//  TajMahal
//

import SwiftUI

// Écran de détail d'un plat : grande photo, niveau d'épice, allergènes et ingrédients
struct DishDetailView: View {
    // Plat à afficher
    let dish: Dish
    // Permet de revenir à l'écran précédent depuis le bouton retour personnalisé
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Photo du plat avec le badge du niveau d'épice en haut à droite
                Image(dish.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 467)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(alignment: .topTrailing) {
                        SpiceLevelView(spiceLevel: dish.spiceLevel, iconSize: 16)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding(12)
                    }
                    .padding(.bottom, 16)

                infoSection(title: "Allergènes:", content: dish.allergens)

                Divider()

                infoSection(title: "Ingrédients:", content: dish.ingredients)
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Chevron de retour suivi du nom du plat, aligné à gauche comme sur la maquette
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .semibold))
                        Text(dish.name)
                            .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                    }
                    .foregroundStyle(.black)
                }
            }
            .hidingSharedBackground()
        }
    }

    // Bloc titre + texte utilisé pour les allergènes et les ingrédients
    private func infoSection(title: String, content: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(Font.custom("PlusJakartaSans-SemiBold", size: 12))
            Text(content)
                .font(Font.custom("PlusJakartaSans-Light", size: 12))
                .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundStyle(Color(.darkGray))
    }
}

#Preview {
    NavigationStack {
        DishDetailView(dish: ViewModel().mainCourseArray[0])
    }
}
