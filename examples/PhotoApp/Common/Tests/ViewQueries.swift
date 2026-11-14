import UIKit

extension UIView {
    var visibleLabelTexts: [String] {
        guard !isHidden else { return [] }
        let ownText = (self as? UILabel)?.text.map { [$0] } ?? []
        return ownText + subviews.flatMap(\.visibleLabelTexts)
    }
}
