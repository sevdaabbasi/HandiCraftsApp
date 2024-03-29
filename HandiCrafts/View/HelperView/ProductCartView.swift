

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoriteManager: FavoriteManager
    @State private var isFavoriteAdded: Bool = false
    @State private var showingFavoriteView: Bool = false

    var product: Product
    var body: some View {
        ZStack {
            Color("Color4")
            
            ZStack(alignment: .bottomTrailing){
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        NavigationLink(destination: FavoriteView(), isActive: $showingFavoriteView) {
                            EmptyView()
                        }
                        Button {
                            favoriteManager.toggleFavorite(product: product)
                            isFavoriteAdded.toggle()
                            if isFavoriteAdded {
                                showingFavoriteView.toggle() // FavoriteView sayfasını göster
                            }
                        } label: {
                            Image(systemName: favoriteManager.isFavorite(product: product) ? "heart.fill" : "heart")
                                .resizable()
                                .foregroundColor(favoriteManager.isFavorite(product: product) ? .red : .pink)
                                .frame(width: 30, height: 30)
                                .padding(.top, 1)
                                .padding(.trailing, 5)
                        }
                    }
                    
                    Image(product.image)
                        .resizable()
                        .frame(width: 150, height: 170)
                        .cornerRadius(12)
                        .padding(.vertical, -20)
                    
                    Text(product.title)
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.vertical, 30)
                    
                    Text(product.supplier)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.vertical,-10)
                    
                    Text("$\(product.price)")
                        .foregroundColor(.black)
                        .bold()
                        .padding(.vertical,-5)
                    
                    Spacer()
                }
                .padding(.vertical, 20)
               
                Button{
                    cartManager.addToCart(product: product)
                } label:{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color("Default"))
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                }
                .padding(.vertical, -60)
                
            }
        }
        .frame(width: 180, height: 300)
        .cornerRadius(10)
    }
}


struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: productList[0])
            .environmentObject(CartManager())
            .environmentObject(FavoriteManager())
    }
}

