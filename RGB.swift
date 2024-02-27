 struct RGB: Equatable {
     var r: Int 
     var g: Int 
     var b: Int 

     init(_ r: Int, _ g: Int, _ b: Int) {
       self.r = r
       self.g = g
       self.b = b
     }
   }

  func hexStringToRGB(_ str: String) -> RGB {

    var colorString = str.uppercased()
    colorString.remove(at: colorString.startIndex) 
    var r = 0, g = 0, b = 0

    if colorString.count == 6 {
        for (index, char) in colorString.enumerated() {
            guard let value = Int(String(char), radix: 16) else {
                fatalError("Invalid hexadecimal character")
            }
            switch index {
            case 0..<2:
                r = r * 16 + value
            case 2..<4:
                g = g * 16 + value
            case 4..<6:
                b = b * 16 + value
            default:
                break
            }
        }
    } else {
        fatalError("Invalid hexadecimal color string")
    }

    return RGB(r, g, b)
  }