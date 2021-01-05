
import UIKit

extension CGSize {
    static func square(_ side: CGFloat) -> CGSize {
        return .init(width: side, height: side)
    }
}

extension CGSize: Comparable {
    public static func < (lhs: CGSize, rhs: CGSize) -> Bool {
        return lhs.width < rhs.width && lhs.height < rhs.height
    }
}

extension CGAffineTransform {
    static func evenScale(_ value: CGFloat) -> CGAffineTransform {
        return .init(scaleX: value, y: value)
    }
    
    func evenScaled(_ value: CGFloat) -> CGAffineTransform {
        return scaledBy(x: value, y: value)
    }
}
