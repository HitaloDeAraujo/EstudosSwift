//
//  DBManager.swift
//  FMDBTut
//
//  Created by admin on 06/02/21.
//  Copyright © 2021 Appcoda. All rights reserved.
//

import UIKit

class DBManager: NSObject {
    static let shared: DBManager = DBManager()
    
    let databaseFileName = "database.sqlite"
    
    var pathToDatabase: String!
    var database: FMDatabase!
    
    override init() {
        super.init()
        
        let documentDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        
        pathToDatabase = documentDirectory.appending("/\(databaseFileName)")
    }
    
    func createDatabase() -> Bool {
        var created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase)
            
            if database != nil {
                if database.open(){
                    
                    
                    let createMoviesTableQuery =
                    "create table movies (\(field_MovieID) integer primary key autoincrement not null, \(field_MovieTitle) text not null, \(field_MovieCategory) text not null, \(field_MovieYear) interger not null, \(field_MovieURL) text, \(field_MovieCoverURL) text not null, \(field_MovieWatched) bool not null default 0, \(field_MovieLikes) integer not null)"
                    
                  
                        do {
                            try database.executeUpdate(createMoviesTableQuery, values: nil)
                            created = true
                        }
                        catch {
                        
                        }
                    
                }
                else {
                    print("Nao foi possivel abrir o banco de dados")
                }
            }
        }
        
        return created
    }
}
