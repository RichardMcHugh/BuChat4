//
//  DataService.swift
//  BuChat3
//
//  Created by Richard McHugh on 09/03/2017.
//  Copyright © 2017 Richard McHugh. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class DataService {

    static let dataService = DataService()
    
    private var _BASE_REF = FIRDatabase.database().reference()
    
    var BASE_REF: FIRDatabaseReference {
    
        return _BASE_REF
    }
    
    var storageRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    
    }
    
    var fileUrl: String!
    
    func Signup(username: String, email: String, password: String, data:NSData){
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
// change request
//            let changeRequest = user?.profileChangeRequest()
//            changeRequest?.displayName = username
//            changeRequest?.commitChanges(completion: { (error) in
//                if let error = error {
//                print(error.localizedDescription)
//                    return
//                }
//            })
//            
//            let filePath = "profileImage\(user!.uid)"
//            let metadata = FIRStorageMetadata()
//            metadata.contentType = "image/jpeg"
            
//            self.storageRef.child(filePath).put(data as Data, metadata: metadata, completion: { (metadata, error) in
//                if let error = error {
////                print("\(error.description)")
//                    return
//                
//                }
//                
//            })
            
//            self.fileUrl = metadata.downloadURLs![0].absoluteString
//            let changeRequestPhoto = user!.profileChangeRequest()
//            changeRequestPhoto.photoURL = NSURL(string: self.fileUrl) as URL?
//            changeRequestPhoto.commitChanges(completion: { (error) in
//                if let error = error {
//                
//                    print(error.localizedDescription)
//                    return
//                    
//                }else {
//                
//                    print("profile updated")
//                    
//                }
//                
//            })
            
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.login()
            
        })
    }
}
