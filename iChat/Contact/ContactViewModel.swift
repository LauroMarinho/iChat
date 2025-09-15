//
//  ContactsViewModel.swift
//  iChat
//
//  Created by Lauro Marinho on 11/04/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ContactViewModel: ObservableObject{
    
    @Published var contacts: [Contact] = []
    @Published var isLoading = false
    
    var isLoaded = false
    
    private let repo: ContactRepository
    
    init (repo: ContactRepository) {
        self.repo = repo
    }
    
    func getContacts(){
        if isLoaded {return}
        isLoading = true
        isLoaded = true
        
        repo.getContacts { contacts in
            self.contacts.append(contentsOf: contacts)
            self.isLoading = false
        }
        
    }
}
