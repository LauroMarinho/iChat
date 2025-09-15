//
//  ContentViewModel.swift
//  iChat
//
//  Created by Lauro Marinho on 10/04/25.
//

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    // verificar se o usuario esta logado - check if the user is logged in
    @Published var isLogged = Auth.auth().currentUser != nil
    
    func onAppear(){
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLogged = user != nil
        }
    }
}
