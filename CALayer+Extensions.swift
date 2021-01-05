
import UIKit

extension CALayer {
    enum CornerRadiusPreset {
        case oval, regular, wide, custom(CGFloat)
    }
    
    func roundCorners(of radius: CornerRadiusPreset) {
        switch radius {
            case .oval:
                cornerRadius = min(bounds.height/2, bounds.width/2)
            case .regular:
                cornerRadius = 8.0
            case .wide:
                cornerRadius = 15.0
            case .custom(let rad):
                cornerRadius = rad
        }
    }
    
    func applyShadow(radius: CGFloat = 6.0, opacity: Float = 0.2) {
        shadowColor = UIColor.black.cgColor
        shadowOpacity = opacity
        shadowRadius = radius
        shadowOffset = CGSize(width: 0, height: 3.0)
    }
    
    func updateShadow(animationDuration: TimeInterval? = nil, oldPath: CGPath? = nil) {
        if let duration = animationDuration {
            let animation = CABasicAnimation(keyPath: "shadowPath")
            animation.fromValue = oldPath ?? shadowPath
            animation.toValue = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            animation.duration = duration
            add(animation, forKey: animation.keyPath)
        }
        shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

    func applyGradient(ofColors colors: [UIColor], ltr: Bool = false) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.masksToBounds = true
        if ltr {
            gradientLayer.startPoint = .init(x: 0.0, y: 0.5)
            gradientLayer.endPoint =   .init(x: 1.0, y: 0.5)
        }
        insertSublayer(gradientLayer, at: 0)
    }
}
