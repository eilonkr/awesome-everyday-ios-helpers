
import UIKit

extension CALayer {
    enum CornerRadiusStyle {
        case oval, custom(CGFloat)
    }
    
    func roundCorners(to radius: CornerRadiusStyle) {
        switch radius {
            case .oval:
                cornerRadius = min(bounds.height/2, bounds.width/2)
            case .custom(let rad):
                cornerRadius = rad
        }
    }
    
    func applyShadow(radius: CGFloat = 6.0, opacity: Float = 0.2, offsetY: CGFloat = 3.0, offsetX: CGFloat = 0.0) {
        shadowColor = UIColor.black.cgColor
        shadowOpacity = opacity
        shadowRadius = radius
        shadowOffset = CGSize(width: offsetX, height: offsetY)
    }

    enum GradientDirection {
        case vertical, horizontal, diagonalLTR, diagonalRTL
        var points: (start: CGPoint, end: CGPoint) {
            var start: CGPoint
            var end: CGPoint
            switch self {
                case .vertical:
                    start = CGPoint(x: 0.5, y: 0.0)
                    end = CGPoint(x: 0.5, y: 1.0)
                case .horizontal:
                    start = CGPoint(x: 0.0, y: 0.5)
                    end = CGPoint(x: 1.0, y: 0.5)
                case .diagonalLTR:
                    start = CGPoint(x: 0.0, y: 0.0)
                    end = CGPoint(x: 0.5, y: 1.0)
                case .diagonalRTL:
                    start = CGPoint(x: 0.0, y: 1.0)
                    end = CGPoint(x: 1.0, y: 0.0)
            }
            return (start, end)
        }
    }
    
    func applyGradient(direction: GradientDirection, colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.masksToBounds = true
        gradientLayer.startPoint = direction.points.start
        gradientLayer.endPoint = direction.points.end
        insertSublayer(gradientLayer, at: 0)
    }
}
