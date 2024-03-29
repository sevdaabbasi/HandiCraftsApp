
import SwiftUI

struct ProfilRowView: View {
   
    let title: String
    var body: some View {
        VStack{
            HStack{
             
                Text(title)
                    .font(.subheadline)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("Default"))
            }
            Divider()
        }
    }
}

#Preview {
    ProfilRowView(title: "    Settings")
}
