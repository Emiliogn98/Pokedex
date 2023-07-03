//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 03/07/23.
//

import Foundation
import CoreData
import UIKit


class LoginViewModel {
    
    // let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func Add(_ username : String, _ password : String) -> Result{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var result = Result()
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        
        let producto = NSManagedObject(entity: entity, insertInto: context)
        
        producto.setValue(username, forKey: "username")
        producto.setValue(password, forKey: "password")
        
        do{
            try context.save()
            result.Correct = true
        }
        catch let error {
            result.Correct = false
            result.ErrorMessage = error.localizedDescription
            result.Ex = error
        }
        
        return result
    }
    static func GetByUsername(_ username : String)-> Result{
        var result = Result()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let response = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
        
        //let predicate = NSPredicate(format: "idProducto = %@", String(IdAlumno))
        
        let predicate = NSPredicate(format: "username = %@", username)
        
        response.predicate = predicate
        
        do{
            var resultFetch = try context.fetch(response)
            if resultFetch.isEmpty {
                print("no hay conincidencias")
                result.Correct = false
            }else{
                result.Objects = []

                 for obj in resultFetch as! [NSManagedObject]{
                     var user = User1()
                     user.username = obj.value(forKey: "username") as! String
                     user.password = obj.value(forKey: "password") as! String

                     result.Objects?.append(user)
                    
                 }
                 
                 try context.save()
                 result.Correct = true
            }
         
        }
        catch let error {
            result.Correct = false
            result.ErrorMessage = error.localizedDescription
            result.Ex = error
        }
        
        return result
        
    }
   static func GetAll() -> Result{
        var result = Result()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let response = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
        
        do{
            let resultFetch = try context.fetch(response)
            result.Objects = []
            for obj in resultFetch as! [NSManagedObject]{
                
             //   var user2 = User1()
                
                var user = User1()
                
                user.username = obj.value(forKey: "username") as? String
                user.password = obj.value(forKey: "password") as? String

                result.Objects?.append(user)
                
            }
            result.Correct = true
        }
        catch let error {
                  result.Correct = false
                  result.ErrorMessage = error.localizedDescription
                  result.Ex = error
              }
        return result
    }
}
