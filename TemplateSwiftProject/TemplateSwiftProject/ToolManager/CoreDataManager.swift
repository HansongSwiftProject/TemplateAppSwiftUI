//
//  CoreDataManager.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import UIKit
import Foundation
import CoreData

class CoreDataManager: NSObject {
    ///获取上下文
    static var viewContext = APPDELEGATE.persistentContainer.viewContext
    
    ///Return - 实体模型
    class func getEntityAndInsertNewObjectWith(entityName: String) -> NSManagedObject {
        
        let model = NSEntityDescription.insertNewObject(forEntityName: entityName, into: APPDELEGATE.persistentContainer.viewContext)
        
        return model
    }
    
    ///保存
    class func saveContext() {
        APPDELEGATE.saveContext()
    }
}
