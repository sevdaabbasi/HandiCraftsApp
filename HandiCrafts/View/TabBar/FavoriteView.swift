
import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager

    var body: some View {
        NavigationStack {
            ScrollView {
                if favoriteManager.favorites.isEmpty {
                    Text("Your Favorites List is Empty")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(favoriteManager.favorites) { product in
                        NavigationLink(destination: FavoriteProductView(product: product)) {
                            FavoriteProductView(product: product)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                       
                       .padding(-10) // Her ürün arasındaki boşluğu kontrol etmek için bu satırı ekledim
                    }
                    .onDelete(perform: { indexSet in
                        let removedProducts = indexSet.map { favoriteManager.favorites[$0] }
                        for product in removedProducts {
                            favoriteManager.toggleFavorite(product: product)
                        }
                    })
                    .padding()

                    PrimaryButton(action: {
                        // Sepeti satın almak gibi bir işlem yapılabilir
                        // Örneğin: favoriteManager.purchaseFavorites()
                    }, title: "Purchase")
                    .padding()
                }
            }
            .navigationTitle(Text("My Favorites"))
            .navigationBarItems(trailing: EditButton()) // Favori ürünleri düzenleme butonu
            .padding(.top)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(FavoriteManager())
    }
}
