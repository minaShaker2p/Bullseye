//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 10.0
  
  @State private var game = Game()
  
  var body: some View {
    ZStack{
      Color("BackgroundColor")
          .ignoresSafeArea()
      VStack{
        Text("🎯🎯🎯 \n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
          .bold()
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
          .kerning(2.0)
          .padding(.horizontal,30.0)
          .foregroundColor(Color("TextColor"))
        
        Text(String(game.target))
          .kerning(-1.0)
          .font(.largeTitle)
          .fontWeight(.black)
          .bold()
          .foregroundColor(Color("TextColor"))

        
        HStack{
          Text("1")
            .bold()
            .foregroundColor(Color("TextColor"))

          Slider(value:$sliderValue ,in: 1.0...100.0)
          
          Text("100")
            .bold()
            .foregroundColor(Color("TextColor"))

        }
        .padding()
        
        Button("Hit me".uppercased()) {
          alertIsVisible = true
        }
        .padding(20.0)
        .background(
          ZStack{
            Color("ButtonColor")
      
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
          }

        )
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .bold()
        .font(.title3)
        .alert("Hello there!",
               isPresented: $alertIsVisible,
               actions: {
          Button("Awesome") {
            print("Alert closed")
          }
        },
               message: {
          let rounderValue :Int = Int(sliderValue.rounded())
          Text("""
              The slider's value is \(rounderValue)
             You scored \(game.points(sliderValue: rounderValue)) points this round
             """)
        })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
                .previewDisplayName("Light")
                .previewDevice("iPhone 14 Pro Max")
            ContentView()
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark")
                .previewDevice("iPhone 14 Pro Max")
        }
        .previewLayout(.sizeThatFits)
    }
}

