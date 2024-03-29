

import SwiftUI
import Firebase

struct SignUpView: View {
    
    
    @State var txtUserName: String = ""
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var isShowePassword: Bool = false
    @State var ShowePassword: Bool = false
    @State var registerUser: Bool = false
    @State var showError = false
    @State var errorMessage = ""
   
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   
    @State private var userNameTextFieldVisible = false

    var body: some View {
        
            ZStack {
                Color(.white).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    VStack {
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .foregroundColor(Color("Default"))

                        Text("enter your emails and password")
                            .foregroundColor(Color.black.opacity(0.4))
                            .padding(.bottom, 50)

                        LineTextField(title: "Email", placholder: "Enter your email address", txt: $txtEmail, keyboardType: .emailAddress)
                            .autocapitalization(.none)
                            .padding(.bottom, 10)

                        LineSecureField(title: "Password", placholder: "Enter your password", txt: $txtPassword, ShowPassword: $ShowePassword)
                            .padding(.bottom, 10)

                        LineTextField(title: "Username", placholder: "Enter your username", txt: $txtUserName, keyboardType: .default)
                            .autocapitalization(.none)
                            .padding(.bottom, 10)

                      
                        Button {
                            FirebaseManager.shared.auth.createUser(withEmail: txtEmail, password: txtPassword){
                                result, error in
                                if error == nil {
                                    return
                                }
                            }
                        }label: {
                            Text("Sign Up")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Default"))
                                .cornerRadius(50)
                        }


                        HStack {
                            Text("Already have an account?")

                           
                            NavigationLink(destination: LoginView()) {
                                    Text("Sign In")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(.vertical)
                                        .foregroundColor(Color("Default"))
                                
                            }
                           
                        }
                    }
                    .onChange(of: registerUser) {
                        // Gerekirse değişiklikleri takip etmek için kullanılabilir
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Text(" You are completely safe.")
                    Text("Read our Terms & Conditions.")
                        .foregroundColor(Color("Default"))
                    Spacer()
                }
                .padding()
            }
           
            .alert(isPresented: $showError) {
                Alert(title: Text(ServiceURL.AppName), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        
    }
   
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
