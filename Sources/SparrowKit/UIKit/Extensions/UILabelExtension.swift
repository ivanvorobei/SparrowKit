// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if canImport(UIKit) && (os(iOS) || os(tvOS))

import UIKit

extension UILabel {
    
    // MARK: - Helpers
    
    /**
     SparrowKit: Manager letter space by Attributed String.
     */
    open var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            } else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            attributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            } else {
                return 0
            }
        }
    }
    
    // MARK: - Layout
    
    /**
     SparrowKit: Layout label with fix widget and dynamic `height`.
     
     If label width fewer of requested value, it set to requested value.
     
     - parameter width: `Widght` of label.
     */
    open func layoutDynamicHeight(width: CGFloat) {
        frame.setWidth(width)
        sizeToFit()
        if frame.width != width {
            frame.setWidth(width)
        }
    }
    
    /**
     SparrowKit: Layout label with fix widget and dynamic `height`.
     
     If label width fewer of requested value, it set to requested value.
     
     - parameter x: Orinig `x` position.
     - parameter y: Orinig `y` position.
     - parameter width: `Widght` of label.
     */
    open func layoutDynamicHeight(x: CGFloat, y: CGFloat, width: CGFloat) {
        frame = CGRect.init(x: x, y: y, width: width, height: frame.height)
        sizeToFit()
        if frame.width != width {
            frame.setWidth(width)
        }
    }
    
    // MARK: - Animations
    
    open func setTextWithFade(newText: String, duration: TimeInterval = 0.6, completion: @escaping (()->Void)) {
        fadeOut(duration: duration / 2) { [weak self] _ in
            guard let self = self else { return }
            self.text = newText
            self.fadeIn(duration: duration / 2) { _ in
                completion()
            }
        }
    }
}

#endif
