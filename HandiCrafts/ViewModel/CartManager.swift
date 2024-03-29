
import Foundation

class CartManager: ObservableObject{
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var total: Int = 0
    
    
    //add to cart function-- sepete ekleme fonksiyonu
    func addToCart(product: Product){
        products.append(product)
        total += product.price
        
    }
    //remove from cart function -- sepetten çıkarma fonksiyonu
    func removeFromCart(product: Product){
        products = products.filter{ $0.id != product.id}
        total -= product.price
    }
    
    
    
}


