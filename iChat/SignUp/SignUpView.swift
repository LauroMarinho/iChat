//
//  SingUpView.swift
//  iChat
//
//  Created by Lauro Marinho on 08/04/25.
//

import SwiftUI


struct SignUpView: View {
    // concecao com a ViewModel
    @StateObject var viewModel = SignUpViewModel(repo: SignUpRepository())
    @State var isShowPhotoLibrary = false
    
    var body: some View {
        // adiciona elementos na ordem que sao colocados)
        VStack{
            
            Button {
                isShowPhotoLibrary = true
            } label: {
                if  viewModel.image.size.width > 0 {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("GreenColor"), lineWidth: 4))
                        .shadow(radius: 7)
                } else {
                    Text("Foto")
                        .frame(width: 130, height: 130)
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(100.0)
                }
            }
                    .padding(.bottom, 32)
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(selectedImage: $viewModel.image)
                    }
                
                // campo do nome
                TextField("Entre com seu nome", text: $viewModel.name)
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
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                
                // botao entrar
                Button{
                    viewModel.signUp()
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
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32.0)
            .background(Color.init(red: 240/255, green: 231/255, blue: 210/255))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    
    
    #Preview {
        SignUpView()
    }

