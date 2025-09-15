//
//  MessagesView.swift
//  iChat
//
//  Created by Lauro Marinho on 10/04/25.
//

import SwiftUI

// message screen
struct MessageView: View {
    @StateObject var viewModel = MessageViewModel(repo: MessageRepository())
    
    var body: some View {
        NavigationView {
            VStack{
                if viewModel.isLoading{
                    ProgressView()
                }
                List(viewModel.contacts, id: \.self) { contact in
                    NavigationLink {
                        ChatView(contact: contact)
                    } label: {
                        ContactMesageRow(contact: contact)
                    }

                    
                }
            }
            .onAppear {
                viewModel.getContacts()
            }
            .navigationTitle("Mensagens")
            .toolbar{
                ToolbarItem(id: "contats", placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true){
                    NavigationLink("Contatos",destination: ContactsView())
                }
                ToolbarItem(id: "logout",
                            placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true){
                    Button("Logout"){
                        viewModel.logout()
                    }
                }
            }
        }

    }
}

struct ContactMesageRow: View {
    
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
            
            VStack(alignment: .leading){
                Text(contact.name)
                if let msg = contact.lastMessage{
                    Text(msg)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    MessageView()
}
