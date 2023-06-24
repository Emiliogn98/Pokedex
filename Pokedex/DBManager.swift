//
//  DBManager.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 23/06/23.
//

import Foundation
import SQLite3

public class DBManager {
    var result = Result()
    
    let dbPath: String = "DBPokedex.sqlite"
    var db:OpaquePointer?
    
    init()
    {
        db = Get()
        createTable()
    
    }
    
    
    
    func Get() -> OpaquePointer?
    {
        
       // let storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.EAguilarEcommerce")!.appendingPathComponent(path)
        
        let filePath = try! FileManager.default.url(for:
                .documentDirectory, in:
                .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
//        let filePathCompartido = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.EGarciaEcommerce")!.appendingPathComponent(dbPath)
//
//                print(filePathCompartido)
              // print(filePath)
        
        //var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            print("fallo la conexion")
            return nil
        }
        else
        {
            print("conexion existosa el pat: \(filePath)")
            //result.Correct = true
            return db
        }
    }
    func createTable() {
       
        let queryTable = "CREATE TABLE IF NOT EXISTS Pokemon (IdPokemon INTEGER NOT NULL,Nombre VARCHAR(50), Imagen VARCHAR(150), Url VARCHAR(150), Order VARCHAR(20) PRIMARY KEY('IdPokemon' AUTOINCREMENT))"
        
        if sqlite3_exec(db,queryTable,nil,nil,nil) != SQLITE_OK {
         print("ocurrio un error al crear la tabla")
        }
    }
}
