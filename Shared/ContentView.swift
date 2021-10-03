//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 03/10/21.
//Project Firebase: Test Firebase 

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home: View {
//    Log Status...
    @AppStorage("log_status") var status = false
    
    var body: some View{
        NavigationView {
            VStack(spacing: 15){
                if status{
//                    Showing log out Button...
                    Text("Logged In")
                    Button {
                        try? Auth.auth().signOut()
                        status = false
                    } label: {
                        Text("LogOut")
                    }

                }else{
//                    Login Button...
                    Text("Logged Out")
                    Button {
                        Auth.auth().signIn(withEmail: "morotto91@outlook.it", password: "123456") { _, err in
                            if let error = err{
                                print(error.localizedDescription)
                                return
                            }
                            self.status = true
                        }
                         
                    } label: {
                        Text("LogIn")
                    }
                }
            }
            .navigationTitle("Firebase Widgets")
            .animation(.easeInOut, value: status)
        }
    }
}

// Creating Widget...

