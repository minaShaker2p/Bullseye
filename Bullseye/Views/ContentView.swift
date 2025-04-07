//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 10.0
  
  @State private var game = Game()
  
  var body: some View {
    VStack{
      Text("🎯🎯🎯 \n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
        
      Text(String(game.target))
        .kerning(-1.0)
        .font(.largeTitle)
        .fontWeight(.black)
        .bold()
      HStack{
        Text("1")
          .bold()
        Slider(value:$sliderValue ,in: 1.0...100.0)
        Text("100")
          .bold()
      }
      Button("Hit me") {
        alertIsVisible = true
      }.alert("Hello there!",
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

#Preview {
    ContentView()
}
