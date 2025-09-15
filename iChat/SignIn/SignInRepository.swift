//
//  SignInRepository.swift
//  iChat
//
//  Created by Lauro Marinho on 09/08/25.
//

import Foundation
import FirebaseAuth

class SignInRepository {
    
    func SignIn(withEmail email: String, password: String, completion: @escaping (String?) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            guard let user = result?.user, err == nil else {
                print(err!)
                completion(err!.localizedDescription)
                return
            }
            print("Usuario logado \(user.uid)")
            completion(nil)
        }
    }
}

