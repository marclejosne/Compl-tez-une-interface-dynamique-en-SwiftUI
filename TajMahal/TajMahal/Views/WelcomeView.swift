//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                // Photo de présentation du restaurant : elle occupe tout l'espace vertical
                // disponible, ce qui garde le bouton en bas quelle que soit la taille d'écran
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay {
                        Image("TajMahal")
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                // Nom du restaurant et logo
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Restaurant Indien")
                            .font(Font.custom("PlusJakartaSans-Regular", size: 12))
                        Text("Taj Mahal")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                    }
                    .foregroundStyle(Color(.darkGray))
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .colorMultiply(.gray)
                }

                // Informations pratiques
                VStack(alignment: .leading, spacing: 14) {
                    infoRow(icon: Image(systemName: "clock"), label: "Mardi", detail: "11h30 - 14h30 • 18h30 - 22h00")
                    infoRow(icon: Image("Icône - Type de Service"), label: "Type de Service", detail: "À emporter")
                    infoRow(icon: Image("Localisation"), label: "12 Avenue de la Brique - 75010 Paris")
                    infoRow(icon: Image("Site"), label: "www.tajmahal.fr")
                    infoRow(icon: Image("Téléphone"), label: "06 12 34 56 78")
                }

                // Bouton d'accès au menu
                NavigationLink {
                    MenuView()
                } label: {
                    Text("Accéder au menu")
                        .font(Font.custom("PlusJakartaSans-SemiBold", size: 16))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .background(Color("CustomRed"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
        }
    }

    // Ligne d'information : icône, libellé et, éventuellement, une valeur alignée à droite.
    // `Text(verbatim:)` évite que l'adresse du site soit transformée en lien bleu.
    private func infoRow(icon: Image, label: String, detail: String? = nil) -> some View {
        HStack(spacing: 10) {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            Text(verbatim: label)
            Spacer()
            if let detail {
                Text(verbatim: detail)
            }
        }
        .font(Font.custom("PlusJakartaSans-Regular", size: 12))
        .foregroundStyle(Color(.darkGray))
    }
}

#Preview {
    WelcomeView()
}
