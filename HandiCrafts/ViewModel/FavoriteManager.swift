
import Foundation

class FavoriteManager: ObservableObject {
    @Published var favorites: [Product] = []

    func isFavorite(product: Product) -> Bool {
        return favorites.contains(product)
    }

    func toggleFavorite(product: Product) {
        if let index = favorites.firstIndex(of: product) {
            favorites.remove(at: index)
        } else {
            favorites.append(product)
        }
    }
    
}

    
