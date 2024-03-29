
import SwiftUI



struct ShowButton: ViewModifier{
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        HStack{
            content
            Button{
                isShow .toggle()
            }label:{
                Image(systemName: isShow ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(.gray)
            }
            
        }
    }
}
