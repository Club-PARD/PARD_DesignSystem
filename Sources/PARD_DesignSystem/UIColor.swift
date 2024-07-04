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
        public let gra = UIColor(colorNamed: "gra")!
    }
}

func gradientImage() -> UIImage {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
    gradientLayer.colors = [UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1).cgColor, UIColor(red: 123/255, green: 63/255, blue: 239/255, alpha: 1).cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    
    UIGraphicsBeginImageContext(gradientLayer.bounds.size)
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

extension UIColor {
    static var primaryBlue: UIColor {
        return UIColor(named: "PrimaryBlue")!
    }
    
    static var primaryPurple: UIColor {
        return UIColor(named: "PrimaryPurple")!
    }
}

extension CAGradientLayer {
    static func gradientLayer(with colors: [UIColor], frame: CGRect, startPoint: CGPoint, endPoint: CGPoint) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        return gradientLayer
    }
}

class GradientLabel: UILabel {
    var gradientColors: [UIColor] = [.primaryBlue, .primaryPurple] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func drawText(in rect: CGRect) {
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            super.drawText(in: rect)
            return
        }
        
        let textRect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        
        // Create gradient layer
        let gradientLayer = CAGradientLayer.gradientLayer(
            with: gradientColors,
            frame: textRect,
            startPoint: CGPoint(x: 0, y: 0),
            endPoint: CGPoint(x: 1, y: 1)
        )
        
        // Render gradient to an image
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Draw the gradient image within the text
        currentContext.saveGState()
        currentContext.clip(to: textRect, mask: currentContext.makeImage()!)
        gradientImage?.draw(in: textRect)
        currentContext.restoreGState()
    }
}
