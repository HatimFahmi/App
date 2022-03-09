//
//  SignUpView.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 06/03/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<Users>
    @Environment(\.managedObjectContext) var moc
    
    @State private var email = ""
    @State private var password = ""
    @State private var repassword = ""
    @State private var wrongemail = 0
    @State private var wrongpassword = 0
    @State private var isActive = false
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                Spacer()
                
                Text("Student Rooms")
                    .font(.system(size: 32, weight: .semibold)).foregroundColor(.white).padding(.bottom, 20)
                
                HStack{
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Email", text: $email).border(.red, width: CGFloat(wrongemail))
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20)
                
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20)
                
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Re Enter Password", text: $repassword).border(.red, width: CGFloat(wrongpassword))
                }.padding(.all, 20).background(Color.white).cornerRadius(8).padding(.horizontal, 20)
                
                NavigationLink(destination: homeView(), isActive: $isActive){
                    Button(action: {
                        authenticateLogUp(email: email, pass: password, repass: repassword)}){
                            Text("SignUp").foregroundColor(.white).font(.system(size: 24, weight: .medium))
                        }.frame(maxWidth: .infinity).padding(.vertical, 20).background(Color.white.opacity(0.1)).cornerRadius(8).padding(.horizontal,20)
                }
                
                Spacer()
                
            }.background{
                Image("andrik-langfield-1-YQiOijio8-unsplash").resizable()
                    .aspectRatio(contentMode: .fill)
            }.edgesIgnoringSafeArea(.all)
            
        }
    }
    func authenticateLogUp(email: String, pass: String, repass: String){
        
        let user = Users(context: moc)
        
        if email.lowercased() == "hatimdd@gmail.com"{
            wrongemail = 0
            if pass == repass{
                user.email = email
                user.password = pass
                try? moc.save()
                wrongpassword = 0
                isActive = true
            }
            else{
                wrongpassword = 2
            }
        }else{
            wrongemail = 2
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
