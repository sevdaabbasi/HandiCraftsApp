
import SwiftUI

import Firebase

struct LoginView: View {
    
    @State var txtUserName: String = ""
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var isShowePassword: Bool = false
    @State var ShowePassword: Bool = false
    @State var registerUser: Bool = false
    @State var showError = false
    @State var errorMessage = ""
    @State private var isLoggedIn = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color (.white).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    VStack{
                        
                        
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .foregroundColor(Color("Default"))
                        
                        Text("enter your emails and password")
                            .foregroundColor(Color.black.opacity(0.4))
                            .padding(.bottom, 50)
                        
                        LineTextField(title:"Email", placholder:"Enter your email address",txt:$txtEmail, keyboardType: .emailAddress)
                            .autocapitalization(.none)
                            .padding(.bottom,10)
                        
                        
                        LineSecureField(title:"Password", placholder:"Enter your password",txt:$txtPassword, ShowPassword: $ShowePassword)
                            .padding(.bottom,10)
                        
                        Button{
                            withAnimation{
                                registerUser.toggle()
                            }
                            
                        }label:{
                            Text("Forgot Password?")
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .foregroundColor(.black)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        
                        Button {
                                                   FirebaseManager.shared.auth.signIn(withEmail: txtEmail, password: txtPassword) { result, error in
                                                       if error == nil {
                                                           // Login successful, set isLoggedIn to true
                                                           isLoggedIn = true
                                                       } else {
                                                           // Show error message
                                                           errorMessage = "Login failed. Please check your credentials."
                                                           showError = true
                                                       }
                                                   }
                                               } label: {
                                                   Text("Sign In")
                                                       .font(.title2)
                                                       .fontWeight(.bold)
                                                       .foregroundColor(.white)
                                                       .frame(maxWidth: .infinity)
                                                       .padding()
                                                       .background(Color("Default"))
                                                       .cornerRadius(50)
                                               }
                                               .background(NavigationLink("", destination: TabBarView(), isActive: $isLoggedIn).hidden())

                        
                        HStack{
                            Text("Don't have an account?")
                            
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign Up")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                    .foregroundColor(Color("Default"))
                            }
                           // .navigationBarBackButtonHidden(true)
                            
                        }
                        
                    }
                    .onChange(of: registerUser){
                        
                        
                        // LoginVM.email = ""
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
            .alert( isPresented: $showError){
                Alert(title: Text(ServiceURL.AppName), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                
                   
            }
            
            
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
