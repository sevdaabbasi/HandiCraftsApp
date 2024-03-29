
import SwiftUI

struct CartButtonView: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing ){
            Image(systemName: "bag.fill")
                .foregroundColor(.black)
                .font(.title2)
                .padding(5)
            if (numberOfProducts > 0) {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.green)
                    .cornerRadius(50)
            
            }
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfProducts: 1)
    }
}
