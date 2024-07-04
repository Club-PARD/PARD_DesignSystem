import UIKit

public extension UIColor {
    private convenience init?(colorNamed: String) {
        self.init(named: colorNamed, in: .module, compatibleWith: nil)
    }
    
    static let pard = Pard()
    
    final class Pard: NSObject {
        override init() { super.init() }
        
        public let background = UIColor(colorNamed: "primaryBlue")!
        
        // Primary
        public let primaryGreen = UIColor(colorNamed: "primaryGreen")!
        public let primaryPurple = UIColor(colorNamed: "primaryPurple")!
        public let primaryBlue = UIColor(colorNamed: "primaryBlue")!
        
        public let errorRed = UIColor(colorNamed: "errorRed")!
        public let white100 = UIColor(colorNamed: "white100")!
        public let gray10 = UIColor(colorNamed: "gray10")!
        public let gray30 = UIColor(colorNamed: "gray30")!
        public let blackCard = UIColor(colorNamed: "blackCard")!
        public let blackBackground = UIColor(colorNamed: "blackBackground")!
        public let gra = UIColor(patternImage: gradientImage(size: CGSizeMake(10, 10)))
//        public let graLayer = UIColor(patternImage: gradientLayer())
    }
}

func gradientLayer() -> CAGradientLayer {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [
        UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1).cgColor,
        UIColor(red: 123/255, green: 63/255, blue: 239/255, alpha: 1).cgColor
    ]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    return gradientLayer
}

func gradientImage(size: CGSize = CGSize(width: 40, height: 40)) -> UIImage {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(origin: .zero, size: size)
    gradientLayer.colors = [
        UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1).cgColor,
        UIColor(red: 123/255, green: 63/255, blue: 239/255, alpha: 1).cgColor
    ]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    
    UIGraphicsBeginImageContext(size)
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
