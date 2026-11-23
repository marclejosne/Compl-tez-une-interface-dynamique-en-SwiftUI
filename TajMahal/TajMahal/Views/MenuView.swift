//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    
    var body: some View {
        List {

            Section("Entrées") {
                ForEach(viewModel.apetizerArray, id: \.name) { dish in
                    NavigationLink {
                        Text(dish.name)
                            .navigationTitle(dish.name)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack(spacing: 12) {
                            Image(dish.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            Text(dish.name)
                        }
                        
                    }
                }
                
            }
            Section("Plats principaux") {
                ForEach(viewModel.mainCourseArray, id: \.name) { dish in
                    NavigationLink {
                        Text(dish.name)
                            .navigationTitle(dish.name)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack(spacing: 12) {
                            Image(dish.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            Text(dish.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("Menu")
                .navigationBarTitleDisplayMode(.inline)
    }
}
    

#Preview {
    NavigationStack {
        MenuView()
    }
}

