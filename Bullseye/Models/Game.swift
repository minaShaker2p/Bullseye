//

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round:Int=1
  
  func points(sliderValue:Int) -> Int{
    let difference : Int = abs(target - sliderValue)
    let awarderPoints:Int = 100 - difference
    return awarderPoints
  }
}

