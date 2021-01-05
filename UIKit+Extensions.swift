
import UIKit

// MARK: - UIScrollView

extension UIScrollView {
    var minContentOffset: CGPoint {
        return CGPoint(
            x: -contentInset.left,
            y: -contentInset.top)
    }

    var maxContentOffset: CGPoint {
        return CGPoint(
            x: contentSize.width - bounds.width + contentInset.right,
            y: contentSize.height - bounds.height + contentInset.bottom)
    }

    func scrollToMinContentOffset(animated: Bool) {
        setContentOffset(minContentOffset, animated: animated)
    }

    func scrollToMaxContentOffset(animated: Bool) {
        setContentOffset(maxContentOffset, animated: animated)
    }
}

// MARK: - UILabel

extension UILabel {
    static func defaultLabel(text: String = "", font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize), textColor: UIColor = .label, alignment: NSTextAlignment = .natural, maxLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = alignment
        label.numberOfLines = maxLines
        label.adjustsFontForContentSizeCategory = true
        return label
    }
}
