//
//  WorkSingle.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import SwiftUI

struct WorkSingle: View {
    var work: Work
    var user: User
    
    var body: some View {
        NavigationLink(destination: WorkDetail(work: work)){
        VStack(spacing:0) {
            /// 这些都是排版
            Image("0")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 0.425*W, height: 0.425*W)
                .clipped()
                .frame(maxWidth: 0.425*W)
            
            Rectangle()
                .frame(height: 0.0025*W)
                .foregroundColor(.gray)
            HStack{
                Text(work.content)
                    .font(.system(size: 14))
                    .padding(.leading,0.02*W)
                    .padding(.vertical,0.02*W)
                Spacer()
            }
            .frame(maxWidth: 0.425*W)
            
            Rectangle()
                .frame(height: 0.002*W)
                .foregroundColor(.gray)
            ZStack{
                HStack{
                    WorkUserInfo(work: work, user:user)
                    .animation(.none)
                    .foregroundColor(.black)
                    
                    Spacer()
                }
                .frame(maxWidth: 0.425*W)
                
                VStack(){
                    Spacer()
                    HStack(spacing:0){
                        Spacer()
                        Image(systemName: "heart")
                            .font(.system(size: 18))
                            .padding(.trailing,0.025*W)
                    }
                    .padding(.bottom,0.03*W)
                }
            }
            .frame(maxWidth: 0.425*W)
            
        }
        .background(Color("Background White"))
        .frame(width: 0.425*W, height: 0.65*W)
        .clipShape(RoundedRectangle(cornerRadius: 0.025*W,style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 0.025*W)
                .stroke(Color.gray, lineWidth: 0.005*W)
        )
        .padding(.vertical,0.015*W)
        .shadow(radius: 10)
        }
        .buttonStyle(PlainButtonStyle())

        
    }
    
}




///这是一个可以复用的一个作品的用户信息，包括头像和用户名还有时间
struct WorkUserInfo: View {
    //MARK：WorkUserInfo
    var work : Work
    var user : User

    var body: some View {
        NavigationLink(destination: UserView(user : user)){
        HStack(alignment: .bottom,spacing: 0){
            Image(user.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 0.1*W, height: 0.1*W)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 0.003*W))
                .padding(.top,0.015*W)
                .padding(.bottom,0.02*W)
                .padding(.trailing,0.02*W)
        


            VStack(alignment: .leading,spacing: 5){
                Text(user.username)
                    .frame(minWidth:0.2*W,alignment: .leading)
                    .font(.system(size: 13))
                    .foregroundColor(.primary)
                    .padding(.top,0.02*W)

                Text(work.createdAt)
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.gray)
                    .padding(.bottom,0.03*W)

            }

        }
        .foregroundColor(.black)
        .frame(width: 0.35*W,height: 0.135*W)
        
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct WorkSingle_Previews: PreviewProvider {
    static var previews: some View {
        WorkSingle(work: WorkStore().works[0], user: userData[0])
    }
}
