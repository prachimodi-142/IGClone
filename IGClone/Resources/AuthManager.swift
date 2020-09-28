//
//  AuthManager.swift
//  IGClone
//
//  Created by Prachi Modi on 9/26/20.
//  Copyright © 2020 Prachi Modi. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion : @escaping (Bool) -> Void) {
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else{
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                completion(false)
            }
        }
        
    }
    public func loginNewUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion (true)
            }
        }
        else if let username = username {
            print(username)
        }
    }
}
