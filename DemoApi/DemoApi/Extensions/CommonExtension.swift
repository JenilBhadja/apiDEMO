//
//  Extension.swift
//  HyGym
//
//  Created by HK on 19/09/22.
//

import Foundation
import UIKit

// MARK: - UIView Extension
extension UIView{
    func setUpGreyBackgroundView(){
        self.backgroundColor = .systemGray
        self.layer.cornerRadius = 5
    }
    
}
// MARK: - UIViewController Extension
extension UIViewController{
    
//    func alertCameraAccessNeeded() {
//        let appName = AppName
//
//        let alert = UIAlertController(title: "This feature requires Camera Access",
//                                      message: "In iPhone settings, tap \(appName) and turn on Camera access",
//                                      preferredStyle: UIAlertController.Style.alert)
//
//        let actionSettings = UIAlertAction(title: "Settings", style: .default, handler: { _ -> Void in
//            guard let settingsAppURL = URL(string: UIApplication.openSettingsURLString) else { return }
//            UIApplication.shared.open(settingsAppURL)
//        })
//
//        let actionCancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ -> Void in
//        })
//
//        alert.addAction(actionSettings)
//        alert.addAction(actionCancel)
//    }
    
}

// MARK: - UILabel Extension
extension UILabel{
    //    func setRegularFontSubTitle(Title: String, fontSize: CGFloat = 14 , textColor: UIColor = .white){
    //        self.text = Title
    //        self.font = R.font.pop
    //        self.textColor = textColor
    //    }
    
    
//    func setAttributeTextWithUnderLine(string1 : String, string2: String){
//        
//        let rangeSignUp = NSString(string: string1).range(of: string2, options: String.CompareOptions.caseInsensitive)
//        let rangeFull = NSString(string: string1).range(of: string1, options: String.CompareOptions.caseInsensitive)
//        let attrStr = NSMutableAttributedString.init(string:string1)
//        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : R.color.themeAppLightGrayColor()!,
//                               NSAttributedString.Key.font : R.font.poppinsRegular(size: 15) as Any],range: rangeFull)
//        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.white,
//                               NSAttributedString.Key.font : R.font.poppinsRegular(size: 15) as Any,
//                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: rangeSignUp)
//        self.attributedText = attrStr
//    }
    
//    func setAttributeTextWithUnderLineForOTP(string1 : String, string2: String, string3: String){
//
//        let rangeSignUp = NSString(string: string1).range(of: string2, options: String.CompareOptions.caseInsensitive)
//        let rangeFull = NSString(string: string1).range(of: string1, options: String.CompareOptions.caseInsensitive)
//        let rangeTime = NSString(string: string1).range(of: string3, options: String.CompareOptions.caseInsensitive)
//
//        let attrStr = NSMutableAttributedString.init(string:string1)
//        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : R.color.themeAppLightGrayColor()!,
//                               NSAttributedString.Key.font : R.font.poppinsRegular(size: 15) as Any],range: rangeFull)
//        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : R.color.themeAppSkyColor()!,
//                               NSAttributedString.Key.font : R.font.poppinsRegular(size: 15) as Any],range: rangeTime)
//        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.white,
//                               NSAttributedString.Key.font : R.font.poppinsRegular(size: 15) as Any,
//                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: rangeSignUp)
//        self.attributedText = attrStr
//    }
}

// MARK: - String Extension
extension String {
    func isEmptyString() -> Bool {
        let _ : Array<String> = []
        let tempText = self.trimmingCharacters(in: CharacterSet.whitespaces)
        if tempText.isEmpty {
            return true
        }
        return false
    }
    
    func validatePhoneNumber(value: String) -> Bool {
        let phoneRegex = "^\\+(?:[0-9]?){6,14}[0-9]$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: value)
    }
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    func isValidPhoneNumber() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"
        
        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&*?]).{8,}")
        return passwordTest.evaluate(with: self)
    }
    
    func encode() -> String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
    }
    
    func decode() -> String{
        return self.removingPercentEncoding ?? ""
    }
    
    func setBoldText(for string: String, font: UIFont) -> NSMutableAttributedString{
        let mutableString = NSMutableAttributedString(string: self)
        let attributes : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : font]
        mutableString.addAttributes(attributes, range: (self as NSString).range(of: string))
        return mutableString
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let _  = NSURL(string: urlString) {
                return true
            }
        }
        return false
    }
    
}

// MARK: - UITableView Extension
extension UITableView {
    
    func registerTableCells(_ classNames: [Any]) {
        for className in classNames {
            let strnibname = String(describing: type(of: className))
            register(UINib(nibName: strnibname, bundle: nil), forCellReuseIdentifier: strnibname)
        }
    }
    
    func reloadWithAnimation(duration: TimeInterval = 0.3,
                             animationOption: UIView.AnimationOptions = .transitionCrossDissolve,
                             completion: @escaping(_ completed: Bool) -> ()) {
        UIView.transition(with: self, duration: duration, options: animationOption) {
            self.reloadData()
        } completion: { (isComplete) in
            if isComplete {
                completion(isComplete)
            }
        }
    }
}
