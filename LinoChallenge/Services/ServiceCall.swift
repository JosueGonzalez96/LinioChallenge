//
//  ServiceCall.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/24/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import UIKit


class ServiceCall: NSObject {
    
    class func initWithURl (url: String, completion:  @escaping (_ err: Error?, _ obj: Any?) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 15.0)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                completion(error! as Error, nil)
            } else {
                
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                let datas = dataString?.data(using: .utf8)
                
                let json: NSArray = try! JSONSerialization.jsonObject(with: datas!) as! NSArray
                
                completion(nil, json)
                
            }
        })
        dataTask.resume()
    }
}
