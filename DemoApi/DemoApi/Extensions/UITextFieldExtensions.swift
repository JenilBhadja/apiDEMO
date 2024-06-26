//
//  UITextFieldExtensions.swift
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Enums
 extension UITextField {
     enum TextType {
        case emailAddress
        case password
        case generic
    }
}

// MARK: - Properties
 extension UITextField {
     var textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                placeholder = "Email Address"
                
            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                placeholder = "Password"
                
            case .generic:
                isSecureTextEntry = false
                
            }
        }
    }
    
    /// SwifterSwift: Check if text field is empty.
     var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    /// SwifterSwift: Return text with no spaces or new lines in beginning and end.
     var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// SwifterSwift: Check if textFields text is a valid email format.
    ///
    ///		textField.text = "john@doe.com"
    ///		textField.hasValidEmail -> true
    ///
    ///		textField.text = "swifterswift"
    ///		textField.hasValidEmail -> false
    ///
     var hasValidEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return text!.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }
    
    @IBInspectable  var textfieldPlaceholderColor: UIColor? {
        get {
            return self.textfieldPlaceholderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    /// SwifterSwift: Left view tint color.
    @IBInspectable  var leftViewTintColor: UIColor? {
        get {
            guard let iconView = leftView as? UIImageView else {
                return nil
            }
            return iconView.tintColor
        }
        set {
            guard let iconView = leftView as? UIImageView else {
                return
            }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
    /// SwifterSwift: Right view tint color.
    @IBInspectable  var rightViewTintColor: UIColor? {
        get {
            guard let iconView = rightView as? UIImageView else {
                return nil
            }
            return iconView.tintColor
        }
        set {
            guard let iconView = rightView as? UIImageView else {
                return
            }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
}

// MARK: - Methods
 extension UITextField {
    
    /// SwifterSwift: Clear text.
     func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    /// SwifterSwift: Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
     func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else {
            return
        }
        self.attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameter padding: amount of padding to apply to the left of the textfield rect.
     func addPaddingLeft(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
     func addPaddingRight(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        rightView = paddingView
        rightViewMode = .always
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image
    ///   - padding: amount of padding between icon and the left of textfield
     func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.leftView = imageView
        self.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.leftViewMode = UITextField.ViewMode.always
    }
    
     func addPaddingLeftIcon_profile(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .left
        self.leftView = imageView
        self.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.leftViewMode = UITextField.ViewMode.always
    }
    
     func addPaddingRigthIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.rightView = imageView
        self.rightView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.rightViewMode = UITextField.ViewMode.always
    }
}


extension UITextField {
    
    //MARK:- Set Image on the right of text fields
    func setupRightImage(imageName:String){
        if imageName != "" {
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
            imageView.image = UIImage(named: imageName)
            let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            imageContainerView.addSubview(imageView)
            rightView = imageContainerView
            rightViewMode = .always
        } else {
            rightView = nil
        }
//        self.tintColor = .lightGray
    }
    
    //MARK:- Set Image on left of text fields
    func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
//        self.tintColor = .lightGray
    }
    
    func setTextFiledUI(textFontColor: UIColor, placeHolderColor: UIColor, fontSize: CGFloat, fontStyle: String, textBackColor: UIColor, textBorderColor: UIColor, textBorderWidth: CGFloat) {
        self.clipsToBounds = true
        self.font = UIFont(name: fontStyle, size: fontSize)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        self.textColor = textFontColor
    }
}

#endif
