//
//  SignInViewModel.swift
//  iChat
//
//  Created by Lauro Marinho on 08/04/25.
//

import Foundation
import FirebaseAuth


// camada da logica de programacao
class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    var alerttext = ""
    
    @Published var IsLoading = false
    
    private let repo: SignInRepository
    
    init(repo: SignInRepository){
        self.repo = repo
    }
    
    func signIn() {
        print("Email: \(email) - Password: \(password)")
        
        IsLoading = true
        
        repo.SignIn(withEmail: email, password: password) { err in
            if let err = err {
                self.formInvalid = true
                self.alerttext = err
            }
            self.IsLoading = false
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            guard let user = result?.user, err == nil else {
                return
            }
            self.IsLoading = false
            print("Usuario logado \(user.uid)")
        }
    }
}
        

