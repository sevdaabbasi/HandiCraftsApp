//
//  HandiCraftsApp.swift
//  HandiCrafts
//
//  Created by Sevda Abbasi on 29.03.2024.
//

import SwiftUI

@main
struct HandiCraftsApp: App {
    @StateObject private var favoriteManager = FavoriteManager()
    @StateObject private var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoriteManager)
                .environmentObject(cartManager)
        }
    }
}
