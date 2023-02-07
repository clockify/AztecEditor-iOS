import Foundation
import UIKit

extension UITextView {
    
    /// Notifies the delegate of a text change.
    ///
    final func notifyTextViewDidChange() {
        if let textView = self as? TextView, !textView.shouldNotifyOfNonUserChanges {
            return
        }
        
        if !isScrollEnabled {
            let fixedWidth = self.frame.size.width
            self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            var newFrame = self.frame
            newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            self.frame = newFrame
        }
        
        delegate?.textViewDidChange?(self)
        NotificationCenter.default.post(name: UITextView.textDidChangeNotification, object: self)
    }

    final func shouldChangeText(in range: NSRange, with text:String) -> Bool {
        guard let result = self.delegate?.textView?(self, shouldChangeTextIn: range, replacementText: text) else {
            return true
        }
        return result
    }
}
