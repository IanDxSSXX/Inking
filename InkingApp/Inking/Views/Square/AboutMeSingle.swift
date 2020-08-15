//
//  AboutMeSingle.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct AboutMeSingle: View {
    
//    @State var position = CGSize.zero
    var work : Work
    var commenter : User
    var comment : Comment
    var body: some View {
        HStack {
            Spacer()
            HStack(spacing:0){
                VStack(spacing:0){
                    CommenterUserInfo(work: work, commenter: commenter)
                    HStack {
                        Text("赞了你了作品")
                            .font(.system(size: 14))
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.red)
                            .font(.system(size:15))
                    }
                }.frame(width: 0.35*W,height: 0.2*W)
                .background(Color("Background White"))

                
                HStack(spacing:2){
                    
                    Text(comment.commContent)
                        .foregroundColor(.gray)
                        .padding(.leading,2)
                        .font(.system(size: 12))
                    Text(":")
                        .font(.system(size: 12))
                    Text(work.content)
                        .font(.system(size: 13))
                        .lineLimit(3)
                    Spacer()
                }
                .frame(width:0.4*W,height: 0.2*W)
                .background(Color("Background White"))
            
                Image(work.workImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:0.2*W,height: 0.2*W)
                    .clipShape(RoundedRectangle(cornerRadius: 0.025*W))
                
            }.frame(width:0.95*W)
                .overlay(
                    RoundedRectangle(cornerRadius: 0.025*W)
                        .stroke(Color.gray, lineWidth: 0.005*W)
            )
            Spacer()
        }.padding(.vertical,8)
            .onTapGesture {

        }
                
    }
}


struct CommenterUserInfo: View {
    var work : Work
    var commenter : User
    
    
    var body: some View {
            HStack(alignment: .bottom,spacing: 0){
            Image(systemName: "trash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 0.1*W, height: 0.1*W)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 0.003*W))
                .padding(.top,0.015*W)
                .padding(.bottom,0.02*W)
                .padding(.leading,0.02*W)
                .padding(.trailing,0.02*W)
            VStack(alignment: .leading,spacing: 5){
                Text(verbatim: commenter.username)
                    .frame(minWidth:0.2*W,alignment: .leading)
                    .font(.system(size: 13))
                    .padding(.top,10)
                Text(work.createdAt)
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.gray)
                    .padding(.bottom,0.03*W)
            }
        }.frame(width: 0.4*W,height: 0.135*W)
        
        
    }
}

