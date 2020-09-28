//
//  DatabaseManager.swift
//  IGClone
//
//  Created by Prachi Modi on 9/26/20.
//  Copyright © 2020 Prachi Modi. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                completion(true)
                return
            }
            else {
                completion(false)
                return
            }
        }
    }
    
    
}
