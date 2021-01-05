
import UIKit

extension UIEdgeInsets {
    static func even(_ value: CGFloat) -> UIEdgeInsets {
        return .init(top: value, left: value, bottom: value, right: value)
    }
    
    static func vertical(_ v: CGFloat, horizontal h: CGFloat) -> UIEdgeInsets {
        return .init(top: v, left: h, bottom: v, right: h)
    }
}

extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
