//
//  AuthViewModel.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import Foundation
import SwiftUI
class AuthViewModel: ObservableObject{
    //كان توكن

    @AppStorage ("currentUserId") var currentUserId: String = ""
    
    func signIn(_ id: UserModel.ID) -> Bool{
        currentUserId = id.uuidString
        return true
    }
    func signOut()->Bool{
        currentUserId = ""
        return false
    }
    func reset() {
        currentUserId = ""
        
    }
}
