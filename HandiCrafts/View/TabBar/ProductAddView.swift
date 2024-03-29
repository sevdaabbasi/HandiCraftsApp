

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

struct ProductAddView: View {
    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productPrice = ""
    @State private var productSupplier = ""
    @State private var selectedCategoryIndex = 0
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false

    var categories = ProductCategories.allCases

    var body: some View {
           NavigationView {
               Form {
                   Section(header: Text("Product Information")) {
                       TextField("Product Name", text: $productName)
                       TextField("Product Description", text: $productDescription)
                       TextField("Product Price", text: $productPrice)
                       TextField("Product Supplier", text: $productSupplier)
                   }

                   Section(header: Text("Category Selection")) {
                       Picker("Category", selection: $selectedCategoryIndex) {
                           ForEach(0..<categories.count) {
                               Text(categories[$0].rawValue)
                           }
                       }
                       .pickerStyle(SegmentedPickerStyle())
                   }

                   Section(header: Text("Product Image")) {
                       if let selectedImage = selectedImage {
                           Image(uiImage: selectedImage)
                               .resizable()
                               .scaledToFit()
                               .frame(height: 150)
                       }
                       ImagePicker(selectedImage: $selectedImage)
                   }

                   Section {
                       Button("Add Product") {
                           addProductToFirestore()
                       }
                   }
               }
               .navigationTitle("Add Product")
           }
       }
    private func addProductToFirestore() {
        guard let selectedImage = selectedImage else {
            print("Please select an image for the product.")
            return
        }

        uploadImageToStorage(image: selectedImage) { imageUrl in
            guard let imageUrl = imageUrl else {
                print("Error uploading image.")
                return
            }

            let product = Product(
                title: productName,
                price: 0,
                description: productDescription,
                supplier: "Unknown",
                image: imageUrl,
                category: categories[selectedCategoryIndex],
                gender: GenderCategory.Home
            )

            let db = Firestore.firestore()
            db.collection("products").addDocument(data: product.toDictionary()) { error in
                if let error = error {
                    print("Error adding product to Firestore: \(error.localizedDescription)")
                } else {
                    print("Product added successfully.")
                    clearForm()
                }
            }
        }
    }
    
    private func uploadImageToStorage(image: UIImage, completion: @escaping (String?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Error converting image to data.")
            completion(nil)
            return
        }

        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imageName = UUID().uuidString
        let imageRef = storageRef.child("images/\(imageName).jpg")

        imageRef.putData(imageData, metadata: nil) { metadata, error in
               if let error = error {
                   print("Error uploading image to storage: \(error.localizedDescription)")
                   completion(nil)
               } else {
                   imageRef.downloadURL { url, error in
                       if let url = url {
                           completion(url.absoluteString)
                       } else {
                           print("Error getting download URL: \(error?.localizedDescription ?? "")")
                           completion(nil)
                       }
                   }
               }
           }
       }

    private func clearForm() {
        productName = ""
        productDescription = ""
        selectedCategoryIndex = 0
        selectedImage = nil
    }
}

struct ProductAddView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAddView()
    }
}

extension Product {
    func toDictionary() -> [String: Any] {
        return [
            "title": title,
            "price": price,
            "description": description,
            "supplier": supplier,
            "image": image,
            "category": category.rawValue,
            "gender": gender.rawValue
        ]
    }
}
