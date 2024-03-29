
import SwiftUI

struct TabBarView: View {
   @State var currentTab: Tab = .Home
   @StateObject var cartManager = CartManager()
    @StateObject var favoriteManager = FavoriteManager()
       
   
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
       
       
        TabView (selection: $currentTab){
            HomeView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Home)

            ShopView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Shop)

            FavoriteView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Favorite)
            
            ProductAddView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.ProductAdd)

            CartView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Cart)

            ProfileView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.Profile)
        }
        .background(Color.white)
        
        .overlay(
            HStack(spacing:0){
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color("Color4"))
            }
            ,
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        
        
    }
func TabButton(tab: Tab) -> some View {
    GeometryReader  {
        proxy in
        Button(action: {
            withAnimation(.spring()){
                currentTab = tab
            }
            
        }, label: {
            VStack(spacing: 0){
                Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                    .resizable()
                    .foregroundColor(Color("Default"))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack{
                            if currentTab == tab {
                                MaterialEffect(style: .light)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                                
                                Text(tab.Tabname)
                                    .foregroundColor(.primary)
                                    .font(.footnote)
                                    .padding(.top, 50)
                            }
                        }
                    ).contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -15 : 0)
            }
        })
    }
    .frame(height: 25)
    
 }
 }



enum Tab: String, CaseIterable{
    case Home = "house"
    case Shop = "cart"
    case Favorite = "heart"
    case ProductAdd = "plus.circle"
    case Cart = "bag"
    case Profile = "person"
   
    
    var Tabname: String {
        switch self {
        case.Home:
            return "Home"
        case.Shop:
            return "Shop"
        case.Favorite:
            return "Favorite"
        case.ProductAdd:
            return "ProductAddView"
        case.Cart:
            return "Cart"
        case.Profile:
            return "Profile"
        }
    }
    
}


extension View {
    func getSafeArea () -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene
        else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets
                
        else{
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style:style))
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(CartManager())
            .environmentObject(FavoriteManager())
        
    }
}




