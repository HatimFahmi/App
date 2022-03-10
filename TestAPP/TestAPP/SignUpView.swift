//
//  SignUpView.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 06/03/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var repassword = ""
    @State private var wrongpassword = 0
    @State private var isActive = false
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
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20)
                
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20)
                
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Re Enter Password", text: $repassword)
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20).border(.red, width: CGFloat(wrongpassword))
                
                if authFail{
                    Text("No Matching passwords").offset(y: -10).foregroundColor(.red)
                }
                
                NavigationLink(destination: homeView(pageview: pageview), isActive: $isActive){EmptyView()}
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("").navigationBarHidden(true)
                
                Button(action: {
                    authenticateLogUp(email: email, pass: password, repass: repassword)}){
                        Text("SignUp").foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                    }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.red.opacity(0.5)).cornerRadius(8).padding(.horizontal,20)
                
                
                Spacer()
                
            }.background{
                Image("andrik-langfield-1-YQiOijio8-unsplash").resizable()
                    .aspectRatio(contentMode: .fill)
            }.edgesIgnoringSafeArea(.all)
            
        }
    }
    func authenticateLogUp(email: String, pass: String, repass: String){
        if pass == repass{
            wrongpassword = 0
            isActive = true
        }
        else{
            authFail = true
            wrongpassword = 2
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
