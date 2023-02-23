//
//  ContentView.swift
//  SwiftUI_JWT_PHP_UserSystem
//
//  Created by Iván Clemente Moreno on 20/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink (destination: LoginView()) {
                    ButtonLoginView()
                }
                
                NavigationLink (destination: RegisterView()) {
                    ButtonRegisterView()
                }
                Spacer()
                
            }
            .navigationTitle("Inicio")
            .navigationBarHidden(true) //Oculto el título del NavigatorView.
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonLoginView: View {
var body: some View {
    Text("iniciar sesión")
        .padding()
        .background(Color .cyan)
        .cornerRadius(15)
        .foregroundColor(Color .white)
}}

struct ButtonRegisterView: View {
var body: some View {
    Text("crear cuenta")
        .padding()
        .background(Color .orange)
        .cornerRadius(15)
        .foregroundColor(Color .white)
}}

