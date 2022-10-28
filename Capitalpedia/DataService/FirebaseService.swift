//
//  FirebaseService.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 26/10/2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirebaseService {
    
    static let shared = FirebaseService()
    
    var db: Firestore
    
    private init() {
        FirebaseApp.configure()

        db = Firestore.firestore()
    }
    
    func addFavouritesToDb() {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
