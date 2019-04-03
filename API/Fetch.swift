//
//  Fetch.swift
//  Roomate
//
//  Created by Derek on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation

//HTTP Methods
enum HttpMethod : String {
    case  GET
    case  POST
    case  DELETE
    case  PUT
}

class Fetch {
    var data:[String:Any] = [String:Any]()
    var url:String?
    var method:HttpMethod?
    var params:[String:Any] = [String:Any]()
    let dispatchGroup = DispatchGroup()
    var delegate: FetchDelegate?
    
    init(url: String, method: HttpMethod, params: [String:Any]) {
        self.url = url
        self.method = method
        self.params = params
    }
    
    func call(){
        dispatchGroup.enter()
        HttpRequest.instance().makeAPICall(url: self.url!, params:self.params, method: self.method!, success: { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let dictionary = json as? [String: Any] {
                self.data = dictionary
                self.dispatchGroup.leave()
            }
        }, failure: { (data, response, error) in
            print(error ?? "error fetching")
            self.dispatchGroup.leave()
        })
    }
    
    func then(){
        call()
        dispatchGroup.notify(queue: .main) {
            self.delegate?.didFinish(self)
        }
    }
    
}


class HttpRequest: NSObject{
    
    //TODO: remove app transport security arbitary constant from info.plist file once we get API's
    var request : URLRequest?
    var session : URLSession?
    
    static func instance() ->  HttpRequest{
        return HttpRequest()
    }
    
    func makeAPICall(url: String,params: Dictionary<String, Any>?, method: HttpMethod, success:@escaping ( Data? ,HTTPURLResponse?  , NSError? ) -> Void, failure: @escaping ( Data? ,HTTPURLResponse?  , NSError? )-> Void) {
        
        request = URLRequest(url: URL(string: url)!)
        
        print("URL = \(url)")
        
        if let params = params {
            
            
            let  jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
            request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request?.httpBody = jsonData

        }
        request?.httpMethod = method.rawValue
        
        
        let configuration = URLSessionConfiguration.default
        
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        
        session = URLSession(configuration: configuration)
        
        session?.dataTask(with: request! as URLRequest) { (data, response, error) -> Void in
            
            if let data = data {
                
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    success(data , response , error as NSError?)
                } else {
                    failure(data , response as? HTTPURLResponse, error as NSError?)
                }
            }else {
                
                failure(data , response as? HTTPURLResponse, error as NSError?)
                
            }
            }.resume()
        
    }
}
