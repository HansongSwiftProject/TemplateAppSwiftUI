//
//  ModelTool.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import Foundation
class ModelTool: NSObject {
    
    //如果不了解泛型，请先去了解泛型
    class func dicToJSONModel<T>(_ type:T.Type, withKeyValues data:[String:Any]) -> T where T:Decodable{
        
        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
        let model = try? JSONDecoder().decode(type, from: jsonData!)
        
        return model!
        
    }
    
    class func arrayToJSONModel<T>(_ type:T.Type, withKeyValuesArray datas: [[String:Any]]) -> [T] where T:Decodable{
        var temp: [T] = []
        for data in datas
        {
            let model:T? = dicToJSONModel(type, withKeyValues: data)
            
            if model == nil
            {
                continue
            }
            temp.append(model!)
        }
        return temp
        
    }
    
}
