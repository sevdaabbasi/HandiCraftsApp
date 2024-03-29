


import SwiftUI
import Firebase
import FirebaseFirestore

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack {
                
                Section{
                    VStack{
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Text("SA")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(.gray)
                            .clipShape(Circle())
                            
                        VStack(alignment: .leading, spacing: 4){
                            Text("Sevda Abbasi")
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text("sevdaabbasi@gmail.com")
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                        }
                        
                        
                        
                    }
                }
                    
                
                VStack(alignment: .leading, spacing: 32) {
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 48)
                            .background(Color("Default"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    HStack {
                        Text("Don't have an account ?")
                        NavigationLink(destination:
                                        LoginView()){
                            Text("Sign Up")
                                .foregroundColor(Color("Default"))
                                .fontWeight(.semibold)
                                .underline()
                        }
                    }
                    .font(.caption)
                }
            
                  

                
              

                VStack(spacing: 24) {
                    ProfilRowView(title: "Settings")
                    ProfilRowView(title: "Orders")
                    ProfilRowView(title: "Wallet")
                    ProfilRowView(title: "Address Details")
                    ProfilRowView(title: "Password Settings")
                    ProfilRowView(title: "Recent Travels")

                    NavigationLink(destination: WelcomeView()) {
                        ProfilRowView(title: "Sign Out")
                            .foregroundColor(Color("Default"))
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    }
                }
                .padding(.vertical)
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

/*func  fetchUserData()async{
    guard let userUID =  Auth.auth().currentUser?.uid else{return}
  guard let user = try? await  Firestore.firestore().collection("Users").document(userUID).getDocument(as: User.self)
    else{return}
    await MainActor.run(body:{ myProfile = user
    })
}*/
