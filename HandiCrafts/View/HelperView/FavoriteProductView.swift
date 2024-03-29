
import SwiftUI

struct FavoriteProductView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
   
    @State private var isFavoriteAdded: Bool = false
    var product: Product
    var body: some View {
        HStack(spacing: 10){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.title)
                    .bold()
                
                Text("$\(product.price)")
                    .bold()
            }
            .padding()
            
            Spacer()
            Button {
                            favoriteManager.toggleFavorite(product: product)
                        } label: {
                            Image(systemName: favoriteManager.isFavorite(product: product) ? "heart.fill" : "heart")
                                .resizable()
                                .foregroundColor(favoriteManager.isFavorite(product: product) ? .red : .black)
                                .frame(width: 25.0, height: 25)
                                .padding(.top, 10)
                                .padding(.trailing, 10)
                        }
         
        }
        .padding(.horizontal)
        .background(Color("Color4"))
        .cornerRadius(15)
        .frame(width: .infinity, alignment: .leading)
        .padding()
        
        .frame(width: 400, height: 80)
        .cornerRadius(10)
    }
}

struct FavoriteProductView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteProductView(product: productList[1])
            .environmentObject(FavoriteManager())
    }
}
