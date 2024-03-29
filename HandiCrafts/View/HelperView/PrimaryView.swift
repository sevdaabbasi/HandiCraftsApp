
import SwiftUI

struct PrimaryButton: View {
    var action: () -> Void
    @State var title: String = "Title"
    var didTap: (()->())?
    var body: some View {
       
        Button {
            didTap?()
        }label: {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Default"))
                .cornerRadius(50)
        }
        
       
    }
}

struct PrimaryButton_Previws: PreviewProvider{
    static var previews: some View{
        PrimaryButton(action: {})
            .frame(minWidth: 100, maxHeight: 400)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
    }
}
