
import SwiftUI

struct ImagePicker: View {
    @Binding var selectedImage: UIImage?
    @State private var isImagePickerPresented = false

    var body: some View {
        Button("Select Image") {
            isImagePickerPresented.toggle()
        }
        .imagePicker(isPresented: $isImagePickerPresented, image: $selectedImage)
    }
}

// ImagePicker extension to present UIImagePickerController
extension View {
    func imagePicker(isPresented: Binding<Bool>, image: Binding<UIImage?>) -> some View {
        modifier(ImagePickerView(isPresented: isPresented, image: image))
    }
}

struct ImagePickerView: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var image: UIImage?

    func body(content: Content) -> some View {
        content.sheet(isPresented: $isPresented) {
            ImagePickerRepresentable(selectedImage: $image)
        }
    }
}

struct ImagePickerRepresentable: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerRepresentable

        init(parent: ImagePickerRepresentable) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    // PresentationMode eklemeyi unutmayın
    @Environment(\.presentationMode) var presentationMode
}


