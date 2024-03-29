


import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.isEmpty {
                Text("Your Cart is Empty")
            } else {
                ForEach(cartManager.products, id: \.id) { product in
                    CartProductView(product: product)
                }
                
                HStack {
                    Text("Your Total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                
                .padding()
                PrimaryButton(action: {}, title: "Buy"){
                  
                }
                    .padding()
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
