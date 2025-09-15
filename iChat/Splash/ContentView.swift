//
//  ContentView.swift
//  iChat
//
//  Created by Lauro Marinho on 10/04/25.
//

import SwiftUI

// tela fake de carregamento - fake loading screen
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
    ZStack {
            if viewModel.isLogged {
                // exibir tela de mensagens
                MessageView()
            } else {
                SignInView() // if the user is not logeed go to SignInView
            }
        }.onAppear{
            viewModel.onAppear()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}


