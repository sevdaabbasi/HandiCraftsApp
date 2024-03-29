



import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    var product: Product

    var body: some View {
        ScrollView {
            ZStack {
                Color.white
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        HStack {
                            Spacer()
                            Image(product.image)
                                .resizable()
                                .ignoresSafeArea(edges: .top)
                                .frame(width: 300, height: 400)
                                .cornerRadius(20)
                            Spacer()
                        }
                        Image(systemName: favoriteManager.favorites.contains(product) ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(favoriteManager.isFavorite(product: product) ? .red : .black)
                            .onTapGesture {
                                favoriteManager.toggleFavorite(product: product)
                            }
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                    }
                    .frame(height: 400)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.title)
                                .font(.title2.bold())
                            Spacer()
                            Text("$ \(product.price).00")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .cornerRadius(12)
                        }
                        .padding(.vertical)
                        
                        HStack(spacing: 10) {
                            ForEach(0..<5) { index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.yellow)
                            }
                            Text("(4.5)")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)
                        
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text(product.description)
                        
                        Spacer()
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                
                                Text("Height: ")
                                    .foregroundColor(.gray)
                                Text("Width: ")
                                    .foregroundColor(.gray)
                                Text("Diameter: ")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                
                                Text("Blue")
                                    .foregroundColor(.blue)
                                Text("Black")
                                    .foregroundColor(.black)
                                Text("Off-white")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical)
                        
                        PrimaryButton(action: {}, title: "")
                            .frame(width: .infinity, height: 35)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[4])
            .environmentObject(FavoriteManager())
    }
}
