
import SwiftUI

struct LineTextField: View {
   
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
  
    
    var body: some View {
        VStack{
            Text(title)
            
                .font(.title3)
                .foregroundColor(.gray)
                .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(40.0)
            
           
                TextField(placholder , text: $txt)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .frame(height: 30)
           
            Divider()
            
        }
    }
}

struct LineSecureField: View {
   
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var ShowPassword: Bool
    var body: some View {
        VStack{
            Text(title)
                .font(.title3)
                .foregroundColor(.gray)
                .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(40.0)
            
            if(ShowPassword){
                TextField(placholder , text: $txt)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $ShowPassword))
                    .frame(height: 30)
                
            }else{
                SecureField(placholder , text: $txt)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $ShowPassword))
                    .frame(height: 30)
            }
            Divider()
            
        }
    }
}
struct LineSecureField2: View {

    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    var body: some View {
        VStack{
            Text(title)
                .font(.title3)
                .foregroundColor(.gray)
                .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(40.0)
            
            if(isShowPassword){
                TextField(placholder , text: $txt)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 30)
                
            }else{
                SecureField(placholder , text: $txt)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 30)
            }
            Divider()
            
        }
    }
}
    struct LineTextField_Previews :PreviewProvider{
        @State static var txt: String = ""
        static var previews: some View{
            LineTextField(txt: $txt)
                .padding(20)
        }
    }
