


import SwiftUI

struct GenderView: View {
    var isSelected: Bool = true
    var title: String = "METİN"
    var body: some View {
        VStack(spacing: 1){
            Text(title)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.Default : Color.Placeholder.opacity(0.5))
            if isSelected{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.Default)
                        .frame(height: 1)
                    Rectangle()
                        .foregroundColor(Color.Default)
                        .frame(width: 5, height: 5)
                        .rotationEffect(Angle(degrees: 45))
                }
            }
            else {
                Divider()
            }
        }
    }
}

#Preview {
    GenderView()
}
