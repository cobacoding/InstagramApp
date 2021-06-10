//
//  DatabaseManager.swift
//  InstagramApp
//
//  Created by Riky Kurniawan on 21/05/21.
//  Copyright © 2021 Riky Developer App. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
//    Check if username and email is availabel
//    Parameters
//    email String representing email
//    username String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
//    insert new user data to database
//    Parameters
//    - email String representing email
//    - username String representing username
//    - completion, async callback for result if database entry succsess
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        // debug
//        print(key)
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                // successed
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
}
