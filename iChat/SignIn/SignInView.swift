//
//  ContentView.swift
//  iChat
//
//  Created by Tiago Aguiar on 07/10/21.
//

import SwiftUI

// camada de visualizacao 
struct SignInView: View {
    
    // concecao com a ViewModel
    @StateObject var viewModel = SignInViewModel(repo: SignInRepository())
    
    var body: some View {
        
        NavigationView {
            // adiciona elementos na ordem que sao colocados)
            VStack{
                // logo
                Image("chat_logo").resizable().scaledToFit().padding()
                
                // campo do e-mail
                TextField("Entre com seu e-mail", text: $viewModel.email)
                    .autocapitalization(.none) // tira o capslock da primeira letra
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay( // borda
                        RoundedRectangle(cornerRadius: 24.0)
                            .stroke(Color(UIColor.separator),style: StrokeStyle(lineWidth: 1.0))
                    )
                
                    .padding(.bottom, 20) // separar os retangulos
                
                
                // campo da senha -> SecureField
                SecureField("Entre com sua senha", text: $viewModel.password)
                    .autocapitalization(.none) // tira o capslock da primeira letra
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay( // borda
                        RoundedRectangle(cornerRadius: 24.0)
                            .stroke(Color(UIColor.separator),style: StrokeStyle(lineWidth: 1.0))
                    )
                
                    .padding(.bottom, 30) // separar os retangulos
                
                if viewModel.IsLoading {
                    ProgressView()
                    .padding()
                }
                
                // botao entrar
                Button{
                    viewModel.signIn()
                } label: {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                }
                
                .alert(isPresented: $viewModel.formInvalid) {
                    Alert(title: Text(viewModel.alerttext))
                }
                
                // dividir a linha
                Divider()
                    .padding()
                
                NavigationLink(destination: SignUpView()){
                    Text("Não tem uma conta? Clique aqui")
                        .foregroundColor(Color.black)
                }
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32.0)
            .background(Color.init(red: 240/255, green: 231/255, blue: 210/255))
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
        }
}


#Preview {
    SignInView()
}

