import Foundation

extension NotificationCenter {
    
    public func addObserver(_ names: NSNotification.Name..., using block: @escaping @Sendable (Notification) -> Void) {
        for name in names {
            NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
        }
    }
    
    public func post(name: NSNotification.Name) {
        post(name: name, object: nil)
    }
}
