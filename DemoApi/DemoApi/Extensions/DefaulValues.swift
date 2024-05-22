import UIKit

class UserDefaultManager {
    
    class func setObjectValueToUserDefaults(idValue: AnyObject, ForKey strKey: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(idValue, forKey: strKey)
        defaults.synchronize()
    }
    
    class func getObjectValueFromUserDefaults_ForKey(strKey: String) -> AnyObject {
        let defaults = UserDefaults.standard
        var obj: AnyObject? = nil
        obj = defaults.object(forKey: strKey) as AnyObject?
        return obj!
    }
    
    class func setDoubleToUserDefaults(value: Double , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getDoubleFromUserDefaults(key: String) -> Double {
        return UserDefaults.standard.double(forKey: key)
    }
    
    class func setFloatToUserDefaults(value: Float , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getFloatFromUserDefaults(key: String) -> Float {
        return UserDefaults.standard.float(forKey: key)
    }
    
    class func setBooleanToUserDefaults(value: Bool , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getBooleanFromUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    class func setStringToUserDefaults(value: String , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func setIntegerToUserDefaults(value: Int , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getIntegerFromUserDefaults(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func getStringFromUserDefaults(key: String) -> String {
        if(UserDefaults.standard.string(forKey: key) == nil) {
            return ""
            //            return "N/A"
        } else {
            return UserDefaults.standard.string(forKey: key)!
        }
    }
    
    class func getStringFromUserDefaultsForCounter(key: String) -> String {
        if(UserDefaults.standard.string(forKey: key) == nil) {
            return "0"
        } else  {
            return UserDefaults.standard.string(forKey: key)!
        }
    }
    
    class func setCustomObjToUserDefaults(CustomeObj: AnyObject , key: String) {
        let defaults = UserDefaults.standard
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: CustomeObj)
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
    
    class func getCustomObjFromUserDefaults(key: String) -> AnyObject {
        let defaults = UserDefaults.standard
        let decoded  = defaults.object(forKey: key) as! NSData
        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded as Data)! as AnyObject
        return decodedTeams
    }
    
    class func removeCustomObject(key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    class func iskeyAlreadyExist(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
        
//    class func resetUserDefaultValues() {
//        UIApplication.shared.applicationIconBadgeNumber = 0
//        //Remove all notifications
//        removeAllNotificationsFromCenter()
//
//        UserDefaultManager.setBooleanToUserDefaults(value: false, key: UD_IsLoggedIn)
//        UserDefaultManager.setStringToUserDefaults(value: "", key: UD_RequestToken)
//        UserDefaultManager.setStringToUserDefaults(value: "", key: UD_AuthToken)
//        UserDefaultManager.setBooleanToUserDefaults(value: false, key: UD_FirstLoadMETab)
//        let defaults = UserDefaults.standard
//        defaults.set(nil, forKey: UD_User)
//        defaults.set(nil, forKey: UD_UserProfile)
//    }
}
