


import SwiftUI

struct ImageSliderView: View {
    @State private var  currentIndex = 0
    var slides: [String] = ["AhşapÜrünler","dokumacılıkÜrünler","makrome","reçeller","turşular","seramik","örgüAna","turşular2"]
    var body: some View {
        ZStack(alignment: .bottomLeading){
            ZStack(alignment: .trailing){
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: 400, height: 400)
                    .padding(1)
                    .cornerRadius(15)
            }
            HStack{
                ForEach(0..<slides.count){index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("Default"): Color("Color4"))
                        .frame(width: 10, height: 10)
                
                }
            }
            .padding()
        }
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }

    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}
