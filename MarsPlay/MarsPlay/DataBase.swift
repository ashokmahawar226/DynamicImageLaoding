//
//  DataBase.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 11/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class DataBase: NSObject {
    static let shared = DataBase.init()
    private override init() {
        //
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MarsPlay")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func insertUserInfomation(_ info :NSData,url : String ) {
        let context = self.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ImageData", in: context)
        let user = NSManagedObject.init(entity: entity!, insertInto: context)
        do {
            user.setValue(info, forKey: "urlImage")
            user.setValue(url, forKey: "url")

        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func fetchUserInformation(_ url : String) -> NSData?{
        let context = self.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageData")
        request.predicate = NSPredicate(format: "url = %@", url)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for obj in result as! [NSManagedObject] {
                return  obj.value(forKey: "urlImage") as! NSData
          }
            
        } catch {
            print("Failed")
        }
        
        return nil
    }
    
    func deleteInformation(){
        let context = self.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageData")
        do {
            let result = try context.fetch(request)
            for obj in result as! [NSManagedObject] {
                context.delete(obj)
            }
            
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        do {
             try context.save()
         } catch {
             let nserror = error as NSError
             fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
         }
        
    }
    
}
