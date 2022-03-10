//
//  homeView.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 07/03/2022.
//

import SwiftUI

struct homeView: View {
    @StateObject var pageview: PageView
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                Spacer()
                switch pageview.currentPage {
                case .home:
                    NavigationView{
                        List(forums, id: \.title){
                            forums in ForumView(forum: forums)
                        }.navigationBarTitle(Text("Forums"), displayMode: .automatic)
                            .navigationBarBackButtonHidden(true)
                            
                        
                    }.edgesIgnoringSafeArea(.top).padding(.horizontal, -8)
                    
                case .contact:
                    NavigationView{
                        ContactView(pageview:pageview ).navigationBarTitle(Text("Get in touch with us"), displayMode: .automatic).navigationBarBackButtonHidden(true)
                      
                        
                    }.edgesIgnoringSafeArea(.top).padding(.horizontal, -8
                    )
                case .add:
                    NavigationView{
                        AddView(pageview:pageview ).navigationBarTitle(Text("Add"), displayMode: .automatic)
                        
                    }.edgesIgnoringSafeArea(.top).padding(.horizontal, -8
                    )
                }
                
                Spacer()
                HStack{
                    TabBar(pageview: pageview, assignedPage: .home, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/7, height: geometry.size.height/7)
                            .shadow(radius: 4)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/7-6, height: geometry.size.height/7-6)
                            .foregroundColor(Color("DarkPurple"))
                    }
                    .offset(y: -geometry.size.height/8/2)
                    .onTapGesture{pageview.currentPage = .add}
                    
                    TabBar(pageview: pageview, assignedPage: .contact, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Contact Us")
                    
                }.frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView(pageview: PageView())
    }
}

struct Forums{
    var title: String
    var name: String
}

var forums = [
    Forums(title: "Arts and humanities academic help", name: "gdj800"),
    Forums(title: "Graduate Schemes", name: "Tiana"),
    Forums(title: "Volunteering and work experience", name: "PQ")
]

struct TabBar: View {
    @StateObject var pageview: PageView
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName:String
    var body: some View {
        
        VStack{
            
            Image(systemName: systemIconName)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: width, height: height).padding(.top, 10)
            Text(tabName).font(.footnote)
            
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            pageview.currentPage = assignedPage
        }
        .foregroundColor(pageview.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}

struct ForumView: View{
    var forum: Forums
    var body: some View{
        VStack(alignment: .leading, spacing: 5){
            Text(forum.title).font(.title).fontWeight(.medium)
            Text(forum.name).font(.headline).fontWeight(.light)
        }.padding(.vertical, 10).padding(.horizontal, -5)
    }
}

struct AddView: View{
    @StateObject var pageview: PageView
    @State var title = ""
    @State var name = ""
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            TextField("Title", text: $title)
                .padding(.all, 20)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .font(.title2)
            
            TextField("Name", text: $name)
                .font(.title2)
                .padding(.all, 20)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            
            Button(action: {
                forums.append(Forums(title: title, name: name))
                pageview.currentPage = .home
            }){Text("Submit")
                    .font(.system(size: 24))
            }.frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            Spacer()
        }.padding()
    }
}

struct ContactView: View{
    @StateObject var pageview: PageView
    @State var fullName = ""
    @State var email = ""
    @State var msg = ""
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            TextField("Full Name", text: $fullName)
                .padding(.all, 20)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .font(.title2)
            
            TextField("Email", text: $email)
                .font(.title2)
                .padding(.all, 20)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            
            TextField("Message", text: $msg)
                .font(.title2)
                .padding(.all, 20)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .padding(.bottom, 30)
            
            Button(action: {
                pageview.currentPage = .home
            }){Text("Submit")
                    .font(.system(size: 24))
            }.frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(Color("TabBarBackground"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            Spacer()
        }.padding()
    }
}
