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
        public let primaryGreen = UIColor(colorNamed: "primaryBlue")!
        public let primaryPurple = UIColor(colorNamed: "primaryBlue")!
        public let primaryBlue = UIColor(colorNamed: "primaryBlue")!
        
        public let errorRed = UIColor(colorNamed: "primaryBlue")!
        public let white100 = UIColor(colorNamed: "primaryBlue")!
        public let gray10 = UIColor(colorNamed: "primaryBlue")!
        public let gray30 = UIColor(colorNamed: "primaryBlue")!
        public let blackCard = UIColor(colorNamed: "primaryBlue")!
        public let blackBackground = UIColor(colorNamed: "primaryBlue")!
        public let gra = UIColor(colorNamed: "primaryBlue")!
    }
}
