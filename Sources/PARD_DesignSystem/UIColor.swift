import UIKit

public extension UIColor {
    static let pard = Pard()

    final class Pard: NSObject {
        override init() { super.init() }

        // Primary
        public var primaryBlue: UIColor { UIColor(named: "primaryBlue", in: .module, compatibleWith: nil) ?? UIColor.blue }
        public var primaryGreen: UIColor { UIColor(named: "primaryGreen", in: .module, compatibleWith: nil) ?? UIColor.green }
        public var primaryPurple: UIColor { UIColor(named: "primaryPurple", in: .module, compatibleWith: nil) ?? UIColor.purple }

        // Else
        public var errorRed: UIColor { UIColor(named: "errorRed", in: .module, compatibleWith: nil) ?? UIColor.red }
        public var white100: UIColor { UIColor(named: "white100", in: .module, compatibleWith: nil) ?? UIColor.white }
        public var gray10: UIColor { UIColor(named: "gray10", in: .module, compatibleWith: nil) ?? UIColor.gray }
        public var gray30: UIColor { UIColor(named: "gray30", in: .module, compatibleWith: nil) ?? UIColor.darkGray }
        public var blackCard: UIColor { UIColor(named: "blackCard", in: .module, compatibleWith: nil) ?? UIColor.black }
        public var blackBackground: UIColor { UIColor(named: "blackBackground", in: .module, compatibleWith: nil) ?? UIColor.black }
    }
}
