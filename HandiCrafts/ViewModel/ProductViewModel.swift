

import Foundation
import Combine
import FirebaseFirestore

class ProductViewModel: ObservableObject {
    @Published var productList: [Product] = []

    func fetchProductsFromFirestore() {
        let db = Firestore.firestore()
        db.collection("products").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching products: \(error.localizedDescription)")
                return
            }

            var fetchedProducts: [Product] = []
            for document in querySnapshot!.documents {
                if let productData = document.data() as? [String: Any],
                   let product = productFromDictionary(productData) {
                    fetchedProducts.append(product)
                }
            }
            self.productList = fetchedProducts
        }
    }
}

func productFromDictionary(_ dictionary: [String: Any]) -> Product? {
    guard
        let title = dictionary["title"] as? String,
        let price = dictionary["price"] as? Int,
        let description = dictionary["description"] as? String,
        let supplier = dictionary["supplier"] as? String,
        let image = dictionary["image"] as? String,
        let categoryRawValue = dictionary["category"] as? String,
        let category = ProductCategories(rawValue: categoryRawValue),
        let genderRawValue = dictionary["gender"] as? String,
        let gender = GenderCategory(rawValue: genderRawValue)
    else {
        return nil
    }

    return Product(
        title: title,
        price: price,
        description: description,
        supplier: supplier,
        image: image,
        category: category,
        gender: gender
    )
}

