//
//  ToolbarContent+Style.swift
//  TajMahal
//

import SwiftUI

extension ToolbarContent {
    // Depuis iOS 26, le système entoure les éléments de la barre de navigation d'une capsule
    // "Liquid Glass". La maquette n'en a pas : on la masque quand l'API est disponible.
    @ToolbarContentBuilder
    func hidingSharedBackground() -> some ToolbarContent {
        if #available(iOS 26.0, *) {
            self.sharedBackgroundVisibility(.hidden)
        } else {
            self
        }
    }
}
