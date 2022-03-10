//
//  LoginView.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 06/03/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongemail = 0
    @State private var wrongpassword = 0
    @State private var isActiveLog = false
    @State private var isActiveSign = false
    @State var authFail: Bool = false
    @StateObject var pageview = PageView()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                Spacer()
                
                Text("Student Rooms")
                    .font(.system(size: 32, weight: .semibold)).foregroundColor(.white).padding(.bottom, 20)
                
                HStack{
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Email", text: $email)
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20).border(.red, width: CGFloat(wrongemail))
                
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20).border(.red, width: CGFloat(wrongpassword))
                
                NavigationLink(destination: homeView(pageview: pageview), isActive: $isActiveLog){EmptyView()}.navigationBarTitle("").navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
                Button(action: {authenticateLogIn(email: email, pass: password)}){
                    Text("Login").foregroundColor(.white).font(.system(size: 24, weight: .medium))
                    
                }.frame(maxWidth: .infinity).padding(.all, 15).background(Color.red.opacity(0.8)).cornerRadius(8).padding(.horizontal,20)
                
                if authFail{
                    Text("Wrong user details").offset(y: -10).foregroundColor(.red)
                }
                
                NavigationLink(destination: SignUpView(), isActive: $isActiveSign){EmptyView()}.navigationBarTitle("").navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
                Button(action: {isActiveSign = true}){
                    Text("SignUp").foregroundColor(.white).font(.system(size: 24, weight: .medium))
                }.frame(maxWidth: .infinity).padding(.vertical, 15).background(Color.white.opacity(0.3)).cornerRadius(8).padding(.horizontal,20)
                Spacer()
                
            }.background{
                Image("andrik-langfield-1-YQiOijio8-unsplash").resizable()
                    .aspectRatio(contentMode: .fill)
            }.edgesIgnoringSafeArea(.all)
            
        }
    }
    
    func authenticateLogIn(email: String, pass: String){
        if email.lowercased() == "hatimdd@gmail.com"{
            wrongemail = 0
            if pass.lowercased() == "pass"{
                wrongpassword = 0
                isActiveLog = true
            }
            else{
                authFail = true
                self.wrongpassword = 2
            }
        }else{
            authFail = true
            self.wrongemail = 2
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            
        }
    }
}
