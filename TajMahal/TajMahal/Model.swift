//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel {
    case light
    case medium
    case hot

    // Nombre de piments "actifs" (rouges) à afficher pour ce niveau, sur une échelle de 3
    var chiliCount: Int {
        switch self {
        case .light: return 1
        case .medium: return 2
        case .hot: return 3
        }
    }
}

// Représente l'objet "plat", qui figure sur la carte du menu
struct Dish {
    var name: String
    var description: String
    var allergens: String
    var ingredients: String
    var spiceLevel: SpiceLevel
    var imageName: String
    // Prix du plat en euros
    var price: Double

    // Prix formaté pour l'affichage, au format de la maquette (ex. "5,50€")
    var formattedPrice: String {
        String(format: "%.2f€", price).replacingOccurrences(of: ".", with: ",")
    }
}
