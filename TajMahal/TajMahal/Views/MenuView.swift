//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste de cartes, regroupées par catégorie
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    // Permet de revenir à l'écran d'accueil depuis le bouton retour personnalisé
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                menuSection(title: "Entrées", dishes: viewModel.apetizerArray)
                menuSection(title: "Plats Principaux", dishes: viewModel.mainCourseArray)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color(.systemGray6))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Chevron de retour sans texte, comme sur la maquette
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.black)
                }
            }
            .hidingSharedBackground()
            // Titre centré de l'écran
            ToolbarItem(placement: .principal) {
                Text("Menu")
                    .font(Font.custom("PlusJakartaSans-Bold", size: 18))
            }
            .hidingSharedBackground()
        }
    }

    // Construit une catégorie du menu : un titre suivi des cartes de ses plats,
    // chacune menant à l'écran de détail du plat
    private func menuSection(title: String, dishes: [Dish]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(Font.custom("PlusJakartaSans-Bold", size: 14))
                .foregroundStyle(Color(.darkGray))

            ForEach(dishes, id: \.name) { dish in
                NavigationLink {
                    DishDetailView(dish: dish)
                } label: {
                    DishRowView(dish: dish)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuView()
    }
}
