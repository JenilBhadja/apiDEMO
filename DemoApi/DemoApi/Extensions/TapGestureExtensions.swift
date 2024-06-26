//
//  TapGestureExtensions.swift
//

import UIKit

class ClassTapGesture: UITapGestureRecognizer {
    let identifier: String
    
    private override init(target: Any?, action: Selector?) {
        self.identifier = ""
        super.init(target: target, action: action)
    }
    
    init(target: Any?, action: Selector?, identifier: String) {
        self.identifier = identifier
        super.init(target: target, action: action)
    }
    
    static func == (left: ClassTapGesture, right: ClassTapGesture) -> Bool {
        return left.identifier == right.identifier
    }
}

extension UIView {
    private var disableKeybordWhenTappedGestureRecognizerIdentifier:String {
        return "disableKeybordWhenTapped"
    }
    
    private var disableKeybordWhenTappedGestureRecognizer: ClassTapGesture? {
        let hideKeyboardGesture = ClassTapGesture(target: self, action: #selector(UIView.hideKeyboardShown), identifier: disableKeybordWhenTappedGestureRecognizerIdentifier)
        
        if let gestureRecognizers = self.gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                if let tapGestureRecognizer = gestureRecognizer as? ClassTapGesture, tapGestureRecognizer == hideKeyboardGesture, tapGestureRecognizer == hideKeyboardGesture {
                    return tapGestureRecognizer
                }
            }
        }
        return nil
    }
    
    @objc private func hideKeyboardShown() {
        endEditing(true)
    }
    
    var disableKeybordWhenTapped: Bool {
        set {
            let hideKeyboardGesture = ClassTapGesture(target: self, action: #selector(UIView.hideKeyboardShown), identifier: disableKeybordWhenTappedGestureRecognizerIdentifier)
            
            if let disableKeybordWhenTappedGestureRecognizer = self.disableKeybordWhenTappedGestureRecognizer {
                removeGestureRecognizer(disableKeybordWhenTappedGestureRecognizer)
                if gestureRecognizers?.count == 0 {
                    gestureRecognizers = nil
                }
            }
            
            if newValue {
                addGestureRecognizer(hideKeyboardGesture)
            }
        }
        
        get {
            return disableKeybordWhenTappedGestureRecognizer == nil ? false : true
        }
    }
}

extension UITableView {
    private var disableKeybordWhenTappedGestureRecognizerIdentifier:String {
        return "disableKeybordWhenTapped"
    }
    
    private var disableKeybordWhenTappedGestureRecognizer: ClassTapGesture? {
        let hideKeyboardGesture = ClassTapGesture(target: self, action: #selector(UITableView.hideKeyboard1), identifier: disableKeybordWhenTappedGestureRecognizerIdentifier)
        
        if let gestureRecognizers = self.gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                if let tapGestureRecognizer = gestureRecognizer as? ClassTapGesture, tapGestureRecognizer == hideKeyboardGesture, tapGestureRecognizer == hideKeyboardGesture {
                    return tapGestureRecognizer
                }
            }
        }
        return nil
    }
    
    @objc private func hideKeyboard1() {
        endEditing(true)
    }
    
    var disableKeybordWhenTappedTbl: Bool {
        set {
            let hideKeyboardGesture = ClassTapGesture(target: self, action: #selector(UITableView.hideKeyboard1), identifier: disableKeybordWhenTappedGestureRecognizerIdentifier)
            
            if let disableKeybordWhenTappedGestureRecognizer = self.disableKeybordWhenTappedGestureRecognizer {
                removeGestureRecognizer(disableKeybordWhenTappedGestureRecognizer)
                if gestureRecognizers?.count == 0 {
                    gestureRecognizers = nil
                }
            }
            
            if newValue {
                addGestureRecognizer(hideKeyboardGesture)
            }
        }
        
        get {
            return disableKeybordWhenTappedGestureRecognizer == nil ? false : true
        }
    }
}

extension UIView {    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            //printMsg(val:  "no action")
        }
    }
}

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
           // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
           let layoutManager = NSLayoutManager()
           let textContainer = NSTextContainer(size: CGSize.zero)
           let textStorage = NSTextStorage(attributedString: label.attributedText!)

           // Configure layoutManager and textStorage
           layoutManager.addTextContainer(textContainer)
           textStorage.addLayoutManager(layoutManager)

           // Configure textContainer
           textContainer.lineFragmentPadding = 0.0
           textContainer.lineBreakMode = label.lineBreakMode
           textContainer.maximumNumberOfLines = label.numberOfLines
           let labelSize = label.bounds.size
           textContainer.size = labelSize

           // Find the tapped character location and compare it to the specified range
           let locationOfTouchInLabel = self.location(in: label)
           let textBoundingBox = layoutManager.usedRect(for: textContainer)
           let textContainerOffset = CGPoint(
               x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
               y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
           )
           let locationOfTouchInTextContainer = CGPoint(
               x: locationOfTouchInLabel.x - textContainerOffset.x,
               y: locationOfTouchInLabel.y - textContainerOffset.y
           )
           let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

           return NSLocationInRange(indexOfCharacter, targetRange)
       }
//    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
//        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
//        let layoutManager = NSLayoutManager()
//        let textContainer = NSTextContainer(size: CGSize.zero)
//    //        let textStorage = NSTextStorage(attributedString: label.attributedText!)
//        let textStorage = NSTextStorage(string: label.text!)
//
//        // Configure layoutManager and textStorage
//        layoutManager.addTextContainer(textContainer)
//        textStorage.addLayoutManager(layoutManager)
//
//        // Configure textContainer
//        textContainer.lineFragmentPadding = 0.0
//        textContainer.lineBreakMode = label.lineBreakMode
//        textContainer.maximumNumberOfLines = label.numberOfLines
//        let labelSize = label.bounds.size
//        textContainer.size = labelSize
//        // Find the tapped character location and compare it to the specified range
//        let locationOfTouchInLabel = self.location(in: label)
//        let textBoundingBox = layoutManager.usedRect(for: textContainer)
//
//        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,y:(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
//        let locationOfTouchInTextContainer = CGPoint(x:locationOfTouchInLabel.x - textContainerOffset.x,
//                                                     y:locationOfTouchInLabel.y - textContainerOffset.y);
//        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//        return NSLocationInRange(indexOfCharacter, targetRange)
//    }
}

