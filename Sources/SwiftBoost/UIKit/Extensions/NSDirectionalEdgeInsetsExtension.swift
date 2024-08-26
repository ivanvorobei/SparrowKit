import UIKit

public extension NSDirectionalEdgeInsets {
    
    init(_ insets: UIEdgeInsets) {
        self.init(top: insets.top, leading: insets.left, bottom: insets.bottom, trailing: insets.right)
    }
    
    var edgeInstset: UIEdgeInsets {
        return .init(top: top, left: leading, bottom: bottom, right: trailing)
    }
}
