//
//  ContactsView.swift
//  iChat
//
//  Created by Lauro Marinho on 11/04/25.
//

import SwiftUI

struct ContactsView: View {
    
    @StateObject var viewModel = ContactViewModel(repo: ContactRepository())
    
    var body: some View {
        VStack{
            if viewModel.isLoading {
                ProgressView()
            }
            List(viewModel.contacts, id: \.self) { contact in
                NavigationLink {
                    ChatView(contact: contact)
                } label: {
                    ContactRow(contact: contact)
                }

            }
        }.onAppear{
            viewModel.getContacts()
        }
        .navigationTitle("Contatos")
    }
}
// celulas dos contato - contact cells
struct ContactRow: View {
    
    var contact: Contact
    
    var body: some View {
        HStack{ // mostrar a imagem - show the image
            AsyncImage(url: URL(string: contact.profileUrl)){ image in
                image.resizable()
                .scaledToFit()
            } placeholder: { // para quando nao tem imagem - for when there is no image
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Text(contact.name)
            
        }
    }
}

#Preview {
    ContactsView()
}
