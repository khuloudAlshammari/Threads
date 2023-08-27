//
//  ThreadsCloneApp.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import SwiftUI

@main
struct ThreadsCloneApp: App {
    @ObservedObject var userPrefrences = UserPrefrencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var post = UserDataViewModel()
    init () {
        auth.reset()
    }
    var body: some Scene {
        WindowGroup {

                RootView().environmentObject(userPrefrences)
                .environmentObject(auth).environmentObject(post)

        }
        
    }
}
