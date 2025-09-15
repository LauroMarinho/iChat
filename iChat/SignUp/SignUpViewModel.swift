//
//  SignUpViewModel.swift
//  iChat
//
//  Created by Lauro Marinho on 08/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import UIKit
import FirebaseStorage

// camada da logica de programacao
class SignUpViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var image = UIImage()
    
    @Published var formInvalid = false
    var alerttext = ""
    
    @Published var isLoading = false
    
    private let repo: SignUpRepository
    
    init(repo: SignUpRepository){
        self.repo = repo
    }
    
    
    func signUp() {
        
        print("nome \(name) ,Email: \(email) - Password: \(password)")
        
        if (image.size.width <= 0) {
            formInvalid = true
            alerttext = "Selecione uma foto"
            return
        }
        
        isLoading = true
        
        repo.signUp(withEmail: email, password: password, image: image, name: name) { err in
            if let err = err{
                self.formInvalid = true
                self.alerttext = err
                print(err)
                
            }
            self.isLoading = false
        }
    }
        
}
