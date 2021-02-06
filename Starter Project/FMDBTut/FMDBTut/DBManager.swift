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
    
    
    let field_MovieID = "movieID"
    let field_MovieTitle = "title"
    let field_MovieCategory = "category"
    let field_MovieYear = "year"
    let field_MovieURL = "movieURL"
    let field_MovieCoverURL = "coverURL"
    let field_MovieWatched = "watched"
    let field_MovieLikes = "likes"
    
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
                    "create table movies (\(field_MovieID) integer primary key autoincrement not null, \(field_MovieTitle) text not null, \(field_MovieCategory) text not null, \(field_MovieYear) integer not null, \(field_MovieURL) text, \(field_MovieCoverURL) text not null, \(field_MovieWatched) bool not null default 0, \(field_MovieLikes) integer not null)"
                  
                        do {
                            try database.executeUpdate(createMoviesTableQuery, values: nil)
                            created = true
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                }
                else {
                    print("Nao foi possivel abrir o banco de dados")
                }
            }
        }
        
        return created
    }
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
    func insertMovieData() {
        if openDatabase() {
            if let pathToMoviesFile = Bundle.main.path(forResource: "movies", ofType: "tsv"){
                do{
                    let moviesFileContents = try String(contentsOfFile: pathToMoviesFile)
               
                    let moviesData = moviesFileContents.components(separatedBy: "\r\n")
                    
                    var query = ""
                    
                    for movie in moviesData {
                        let movieParts = movie.components(separatedBy: "\t")
                        
                        if movieParts.count == 5 {
                            let movieTitle = movieParts[0]
                            let movieCategory = movieParts[1]
                            let movieYear = movieParts[2]
                            let movieUrl = movieParts[3]
                            let movieCoverURL = movieParts[4]
                            
                            query += "insert into movies (\(field_MovieID), \(field_MovieTitle), \(field_MovieCategory), \(field_MovieYear), \(field_MovieURL), \(field_MovieCoverURL), \(field_MovieWatched), \(field_MovieLikes)) values (null, '\(movieTitle)', '\(movieCategory)', '\(movieYear)', '\(movieUrl)', '\(movieCoverURL)', 0, 0);"
                            
                            if !database.executeStatements(query) {
                                print("Falha ao inserir dados iniciais na base de dados")
                                
                                print(database.lastError(), database.lastErrorMessage())
                            }
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
