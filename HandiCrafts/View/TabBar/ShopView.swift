
import SwiftUI

struct ShopView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoriteManager: FavoriteManager
    @State private var searchText: String = ""
    @State private var presentSideMenu = false
    @StateObject private var productViewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                NavigationStack {
                    ZStack(alignment: .top) {
                        Color.white.edgesIgnoringSafeArea(.all)
                        VStack(spacing: 0) {
                            AppBar {
                                presentSideMenu.toggle()
                            } cartAction: {
                                // Cart action
                            }

                            SearchView(searchText: $searchText)

                            if !productViewModel.productList.isEmpty {
                                HeroImageView(filteredProducts: filterProducts(startingWith: searchText.lowercased()))
                            } else {
                                Text("Loading products...")
                                    .padding()
                            }
                        }
                        Spacer()
                            .edgesIgnoringSafeArea(.all)
                    }
                }

                SideMenu()
            }
        }
        .onAppear {
            productViewModel.fetchProductsFromFirestore()
        }
        .environmentObject(cartManager)
        .environmentObject(favoriteManager)
    }

    private func SearchView(searchText: Binding<String>) -> some View {
           HStack {
               Image(systemName: "magnifyingglass")
                   .foregroundColor(.gray)
                   .padding(.trailing, -10)

               TextField("Search...", text: searchText)
                   .padding(.horizontal)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
           }
       }

    private func HeroImageView(filteredProducts: [Product]) -> some View {
        if filteredProducts.isEmpty {
            return AnyView(Text("No products found"))
        } else {
            return AnyView(
                ScrollView(.vertical, showsIndicators: false) {
                    let productGroups = filteredProducts.chunked(into: 2)

                    ForEach(productGroups, id: \.self) { productGroup in
                        HStack(spacing: 16) {
                            ForEach(productGroup, id: \.id) { product in
                                NavigationLink(destination: ProductDetailsView(product: product)) {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                      
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            )
        }
    }

    @ViewBuilder
    private func SideMenuView() -> some View{
        
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
        
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
        
    }

    private func filterProducts(startingWith searchString: String) -> [Product] {
        return productViewModel.productList.filter { $0.title.lowercased().starts(with: searchString) }
    }
}

// Bir diziyi alt dizilere bölmek için uzantı
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView().environmentObject(CartManager()).environmentObject(FavoriteManager())
    }
}
