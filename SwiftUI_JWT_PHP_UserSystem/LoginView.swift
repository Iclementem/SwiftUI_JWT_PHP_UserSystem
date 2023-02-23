//
//  LoginView.swift
//  SwiftUI_JWT_PHP_UserSystem
//
//  Created by Iván Clemente Moreno on 23/2/23.
//

import SwiftUI

struct User: Codable {
    var username: String
    var token: String
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isLoggingIn = false

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: login) {
                if isLoggingIn {
                    ProgressView()
                } else {
                    Text("Login")
                }
            }
            .disabled(isLoggingIn)
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func login() {
        isLoggingIn = true
        let parameters = ["username": username, "password": password]
        guard let url = URL(string: "http://trimbotest.ddns.net/SwiftUI_JWT_PHP/login.php") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoggingIn = false
            }

            if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    // Save the user's token to UserDefaults or Keychain
                } catch {
                    alertMessage = "Invalid username or password"
                    showingAlert = true
                }
            } else if let error = error {
                alertMessage = error.localizedDescription
                showingAlert = true
            }
        }.resume()
    }
}

