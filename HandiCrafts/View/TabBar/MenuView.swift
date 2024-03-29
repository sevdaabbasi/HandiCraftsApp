
import SwiftUI

struct MenuView: View {
    @State var presentSideMenu = true
    var body: some View {
        ZStack{
            SideMenuView()
            
        }.background(.black)
    }
    @ViewBuilder
    private func SideMenuView() -> some View{
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }

}

#Preview {
    MenuView()
}
struct SideMenuViewContents: View {
    @Binding var presentSideMenu: Bool
        
    var categories = [Categories.Ahsap.rawValue, Categories.Dokumacilik.rawValue, Categories.Seramik.rawValue, Categories.Urgancilik.rawValue, Categories.Dekor.rawValue]
    
    @State private var visibleCategories: [String] = []
    
    @State private var selectedCategory: Int = 0
    
    var body: some View {
        HStack{
            ZStack{
                VStack(alignment: .leading) {
                    SideMenuTopView()
                    HStack(spacing: 10){
                        GenderView(isSelected: selectedCategory == 0, title: "HOME" )
                            .onTapGesture {
                                selectedCategory = 0
                            }
                        GenderView(isSelected: selectedCategory == 1, title: "FOOD" )
                            .onTapGesture {
                                selectedCategory = 1
                            }

                        GenderView(isSelected: selectedCategory == 2, title: "CLOTHING" )
                            .onTapGesture {
                                selectedCategory = 2
                            }
                    }
                    .frame(maxWidth: .infinity)
                   
                    ForEach(0..<categories.count, id: \.self) {i in CategoryItem(title: categories[i]){
                    }
                    }
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        HStack{
                            Image("telephone")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("(...)... ....")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)
                        .padding(.top, 10)
                    }
                    Button{
                        
                    }label: {
                        HStack{
                            Image("location")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("Store locator")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)
                        .padding(.top, 10)
                        
                    }
                    VStack(alignment: .center){
                        Image("divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 220)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    HStack(spacing: 30){
                        Spacer()
                        Image("Tiwitter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        Image("Youtube")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        Image("instagram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        .padding([.leading, .trailing], 20)
    }
    
    
    func SideMenuTopView() -> some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                }label: {
                    Image("Close")
                           .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }
    
    @ViewBuilder
    func CategoryItem(title: String, action: @escaping(() -> Void)) -> some View {
        Button {
            action()
        }label: {
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 50)
        .padding(.leading, 30)
        .padding(.top, 10)
    }
}


