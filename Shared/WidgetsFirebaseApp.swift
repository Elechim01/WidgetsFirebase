//
//  WidgetsFirebaseApp.swift
//  Shared
//
//  Created by Michele Manniello on 03/10/21.
//

import SwiftUI
import Firebase

@main
struct WidgetsFirebaseApp: App {
    init(){
        FirebaseApp.configure()
        do{
            try Auth.auth().useUserAccessGroup("\(teamID).com.MicheleManniello.WidgetsFirebase")
        }catch{
            print(error.localizedDescription)
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
