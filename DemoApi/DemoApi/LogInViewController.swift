//
//  LogInViewController.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 10/02/23.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController {

    
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBOutlet weak var btnSignIn : UIButton!
    
    
    var strEmail = ""
    var strPassword = ""
    
    var namesArrOfStr : [String] = []
    var userNameArrOfStr : [String] = []
    var userArray: [[String: String]] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.addPaddingLeft(10)
        txtPassword.addPaddingLeft(10)
        
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()


    }
    
}
        
extension LogInViewController{
    
    @IBAction func btnClickSignIn(_ sender: UIButton) {
        strEmail = txtEmail.text ?? ""
        print(strEmail)
        strPassword = txtPassword.text ?? ""
        print(strPassword)
        self.APICallLogin()
    }
    
}
        
extension LogInViewController {
    
  
    func parseLoginResponse(data: Data) -> (errorMessage: String?, data: [String:Any]?) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                if let error = json["error"] as? Bool {
                    if error == true {
                        return (json["message"] as? String, nil)
                    } else {
                        return (nil, json["data"] as? [String:Any])
                    }
                }
            }
        } catch {
            return ("Error parsing response", nil)
        }
        return (nil, nil)
    }

    func APICallLogin(){
        
//        AF.request("https://jsonplaceholder.typicode.com/users" ,method: .get)
//                    .responseData { [self] response in
//                        switch response.result {
//                        case .success(let data):
//                            do {
//                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]]{
//
//                                    print(json)
//                                    for i in json{
//                                        if let name = i["name"] as? String,let username = i["username"]as? String {
//                                            self.namesArrOfStr.append(name)
//                                            self.userNameArrOfStr.append(username)
//
//                                            self.userArray.append(["name": name,
//                                                                   "username": username])
//                                        }
//                                    }
//                                    print(userArray)
//                                }
//                            }catch {
//                                print("errorMsg")
//                            }
//                        case let .failure(error):
//                            print(error)
//                        }
//                    }
        
        let params =  ["username" : strEmail,
                       "password" : strPassword]

        AF.request("http://172.105.35.50:4803/api/users/login",method: .post,parameters: params)
            .responseData { responseP in
            switch responseP.result {
            case .success(let data):
                let result = self.parseLoginResponse(data: data)

                if let errorMessage = result.errorMessage{
                    print("Error message: \(errorMessage)")
                } else if let data = result.data {
                    print("Data of \(self.strEmail) = \(data)")
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
//import Alamofire
//
//func uploadFile() {
//    let url = "https://example.com/upload"
//    let headers: HTTPHeaders = [
//        "Authorization": "Bearer your_token",
//        "Content-Type": "multipart/form-data"
//    ]
//
//    let parameters = [
//        "name": "John Doe"
//    ]
//
//    let imageData = UIImage(named: "image.png")!.jpegData(compressionQuality: 0.5)!
//
//    let multipartFormData = createMultipartFormData(parameters: parameters, imageData: imageData)
//
//    Alamofire.upload(multipartFormData: multipartFormData, to: url, method: .post, headers: headers) { result in
//        switch result {
//        case .success(let upload, _, _):
//            upload.uploadProgress { progress in
//                // Handle upload progress updates
//                print("Upload Progress: \(progress.fractionCompleted)")
//            }
//
//            upload.downloadProgress { progress in
//                // Handle download progress updates
//                print("Download Progress: \(progress.fractionCompleted)")
//            }
//
//            upload.responseData(queue: DispatchQueue.global(qos: .background)) { response in
//                if let data = response.data {
//                    // Handle the response data
//                    print(data)
//                }
//            }
//        case .failure(let error):
//            // Handle the error
//            print(error)
//        }
//    }
//}
//
//// Call the uploadFile function to initiate the upload
//uploadFile()
