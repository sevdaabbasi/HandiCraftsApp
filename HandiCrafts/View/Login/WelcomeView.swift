
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("Color4")
                VStack {
                    Image("elSanatlari")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 1.0, height: UIScreen.main.bounds.height * 0.4)
                    NavigationLink() {
                        LoginView()
                    } label: {
                       Text( "Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Default"))
                            .cornerRadius(50)
                            .padding()
                    }
                }
                .padding()
            }
        }
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().statusBar(hidden: true)
        
    }
}
