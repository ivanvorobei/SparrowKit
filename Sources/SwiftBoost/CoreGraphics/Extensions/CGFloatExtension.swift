#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat {
    
    public func rounded(to places: Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
#endif
