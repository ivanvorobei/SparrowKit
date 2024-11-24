import UIKit

public extension UIScreen {
    
    var displayCornerRadius: CGFloat {
        guard let cornerRadius = self.value(forKey: "_displayCornerRadius") as? CGFloat else {
            return .zero
        }
        return cornerRadius
    }
}
