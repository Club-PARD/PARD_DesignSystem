import UIKit

public extension UIColor {
    private convenience init?(colorNamed: String) {
        self.init(named: colorNamed, in: .module, compatibleWith: nil)
    }

    static let pard = Pard()

    final class Pard: NSObject {
        override init() { super.init() }
        
        public let background = UIColor(colorNamed: "background")!

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
