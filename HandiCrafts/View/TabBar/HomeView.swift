

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoriteManager: FavoriteManager
    
    @State var presentSideMenu = false
    @State private var selectedCategory: Int = 0
    
    
    var body: some View {
        
            ZStack(alignment: .top){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                NavigationStack {
                    VStack(spacing: 0){
                        AppBar {
         
                         
                            presentSideMenu.toggle()
                        }cartAction: {
                            
                        }
                        ScrollView(.vertical){
                            
                            ImageSliderView()
                            HeroImageView()
                            
                            CollectionsView()
                                .font(.title)
                            
                            Spacer()
                            
                            
                        }
                        .edgesIgnoringSafeArea(.all)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                SideMenu()
                
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
    
    
    
    
    
    
    @ViewBuilder
    private func CollectionsView() -> some View {
        
        
        Image("örgü")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 330, alignment: .top)
            .clipped()
        
        Image("turşu2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 260, alignment: .top)
            .clipped()
        
        Image("divider")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .padding(.top, 20)
    }
    
    
    @ViewBuilder
    private func HeroImageView() -> some View {
        VStack{
            Text("New Products")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color("Default"))
            
            Spacer()
            
            
        }
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(productList, id: \.id){product in
                    NavigationLink{
                        ProductDetailsView(product: product)
                    } label: {
                        ProductCardView(product: product)
                        
                           // .environmentObject(CartManager())
                            .environmentObject(favoriteManager)
                        
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

    
struct AppBar: View {
    typealias ButtonAction = () -> Void
    var menuAction: ButtonAction
    var cartAction: ButtonAction
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack{
                    HStack{
                        /////////////////////
                        Button{
                            menuAction()
                        }label: {
                            Image ("Menu")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 24, height: 24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 220, height: 220)
                       
                        
                        Spacer()
                        
                        NavigationLink(destination: CartView()
                            .environmentObject(cartManager)
                                       
                        ){
                            CartButtonView(numberOfProducts: cartManager.products.count)
                        }
                    }
                    .frame(width: 12, height: 5)
                    .frame(maxWidth: .infinity, alignment: .bottom)

                }
                //////////
            }
        }
        .padding()
        .environmentObject(CartManager() )
    }
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartManager())
            .environmentObject(FavoriteManager())
    }
}
