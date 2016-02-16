//
//  qualitySearch.swift
//  AirQuality
//
//  Created by chad parr on 2/16/16.
//  Copyright © 2016 chad parr. All rights reserved.
//

import Foundation
import Alamofire

class qualitySearch {
    
    var objects = [[String: String]]()
    
    var _face : String!
    var _stock : String!
    var _price : String!
    
    
    
    func downloadDetails(completed: DownloadComplete, search: String){
        
        var faceNum = 1
        
        let searched = search + "limit(1)?limit=1"
        
        while faceNum <= 10 {
            faceNum++
            
            let url = NSURL(string: searched)!
            
            Alamofire.request(.GET, url).responseJSON  { response in
                // debugPrint(response)
                
                let result = response.result
                
                result.value
                
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    
                    if let price = dict["price"] as? Int {
                        self._price = "\(price)"
                        print(price)
                        
                    }
                    
                    if let face = dict["face"] as? String {
                        self._face = face
                        print(face)
                    }
                    
                    if let stock = dict["stock"] as? Int {
                        self._stock = "\(stock)"
                        print(stock)
                    }
                    let obj = ["face": self._face!, "price": self._price!, "stock": self._stock!]
                    self.objects.append(obj)
                    print("Items in dict")
                    print(self.objects.count)
                    
                    
                    
                }
                completed()
            }
            
        }
    }
    
    
    
    
    
    
}