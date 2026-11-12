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
//        NavigationStack {
//            Image("TajMahal")
//            Spacer()
//            NavigationLink {
//                MenuView()
//            } label : {
//                Text("Menu")
//            }
//        }
        
        NavigationStack {
        VStack(alignment:.leading, spacing: 15) {
            Image("TajMahal")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(maxWidth: .infinity)
            
            HStack(alignment: .center, spacing: 5) {
                VStack(alignment:.leading) {
                    Text("restaurant indien")
                        .font(Font.custom("PlusJakartaSans-Light", size: 12))
                    Text("Taj Mahal")
                        .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:50, height:50)
                    .colorMultiply(.gray)
            }
            HStack(spacing: 8) {
                Image(systemName: "clock")
                    .frame(width: 16, height: 16)

                Text("Mardi")

                Spacer()

                Text("11h30 à 14h30 / 18h30 à 22h00")
            }
            HStack(spacing: 8) {
                Image("Icône - Type de Service")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)

                Text("Type de service")

                Spacer()

                Text("À emporter")
            }
            HStack(spacing: 8) {
                Image("Localisation")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)

                Text("12 avenue de la Brique, Paris")
            }
            HStack(spacing: 8) {
                Image("Site")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)

                Text("www.tajmahal.fr")
            }
            HStack(spacing: 8) {
                Image("Téléphone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text("01 23 45 67 89")}
            NavigationLink {
                MenuView()
            } label: {
                    Text("Accéder au menu")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .foregroundStyle(.white)
                        .background(Color("CustomRed"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    WelcomeView()
}
