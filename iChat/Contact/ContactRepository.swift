//
//  ContactRepository.swift
//  iChat
//
//  Created by Lauro Marinho on 09/08/25.
//


import Foundation
import FirebaseFirestore
import FirebaseAuth

class ContactRepository {
    
    func getContacts(completion: @escaping ([Contact]) -> Void) {
        var contacts: [Contact] = []
        Firestore.firestore().collection("users")
            .getDocuments { querySnapshot, error in
                if let error = error {
                    print("Erro ao buscar contatos: \(error)")
                    completion([])
                    return
                }

                guard let snapshot = querySnapshot else {
                    print("querySnapshot veio nil")
                    completion([])
                    return
                }

                for document in snapshot.documents {
                    if Auth.auth().currentUser?.uid != document.documentID {
                        let data = document.data()
                        print("ID \(document.documentID) \(data)")

                        guard let name = data["name"] as? String, !name.isEmpty else {
                            print("Campo 'name' ausente ou inválido no documento \(document.documentID)")
                            continue
                        }

                        let profileUrl = (data["profileUrl"] as? String) ?? (data["ProfileUrl"] as? String) ?? ""

                        contacts.append(Contact(uuid: document.documentID,
                                                name: name,
                                                profileUrl: profileUrl))
                    }
                }
                
                completion(contacts)
            }
    }
}
