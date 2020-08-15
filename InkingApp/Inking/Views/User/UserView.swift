//
//  UserView.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import SwiftUI

struct UserView: View {
    @Environment(\.presentationMode) var presentationMode
    var user: User
    var body: some View {
        VStack {
            UserInfoHead(user: user)
                .padding(.bottom,18)
                .zIndex(2)
            SignatureView(user: user)
                .padding(.bottom,18)
            ConsAndFans(user:user)
                .padding(.bottom,18)
            WorkList(works: workData, user: user)
            Text("  ").font(.system(size:50))

        }
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(leading:
            HStack{
                Spacer()
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "chevron.left")
                    .foregroundColor(.primary)
                }
                Spacer(minLength: W*0.6)

            })
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: userData[0])
    }
}

struct UserInfoHead: View {
    @State var isfollow = false
    var user : User
    var body: some View {
        HStack {
            Image(user.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 0.2*W, height: 0.2*W)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 0.003*W))
                .padding(.top,0.015*W)
                .padding(.trailing,0.02*W)
            
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.system(size: 19))
                    .padding(.bottom)
                Text("id: "+user.userID)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            VStack{
                if user != userData[3]
                {
                    if isfollow == false {
                        Image(systemName: "star")
                            .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                            .font(.system(size: 26))
                            .onTapGesture {
                                self.isfollow.toggle()
                            }
                .zIndex(2)
                    Text("关注")
                        .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                        .font(.system(size: 16))
                    }
                    else {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                            .font(.system(size: 26))
                            .zIndex(2)
                            .onTapGesture {
                                self.isfollow.toggle()
                            }

                        Text("关注")
                        .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                        .font(.system(size: 16))

                    }
                    

                }
                else {
                    NavigationLink(destination: SettingView()){
                        Image(systemName: "gear")
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                            .font(.system(size: 26))
                    }.zIndex(2)
                    Text("设置")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .font(.system(size: 16))


                }

                
                }
            
        }.frame(width:0.9*W)
        
        
            
    }
}



struct SignatureView: View {
    var user : User
    var body: some View {
        Image(user.signature)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:0.9*W,height: 0.2*W)
            .clipped()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 0.025*W)
                    .stroke(Color.gray, lineWidth: 0.005*W)
        )
    }
}


struct ConsAndFans: View {
    var user : User

    var body: some View {
        HStack(spacing:0.03*W){
            HStack{
                Text("关注")
                Text("10")
                    .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                
            }.frame(width:0.42*W,height:0.1*W)
                .background(Color("Lighter Grey"))
            HStack{
                Text("粉丝")
                Text("10")
                    .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                
            }.frame(width:0.42*W,height:0.1*W)
                .background(Color("Lighter Grey"))
        }
    }
}



