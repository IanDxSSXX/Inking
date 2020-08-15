//
//  WorkDetail.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import SwiftUI

struct WorkDetail: View {
    var work : Work
    @Environment(\.presentationMode) var presentationMode

    init(work tem: Work) {
        work = tem
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = UIColor(named: "White")
        appearance.backgroundColor = UIColor(named: "White")

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

    }


    var body: some View {
        ScrollView {
            VStack {
                UserCommentView(work: work)
                StateBar(work: work)
                CommenterView(work: work)
                Spacer()
            }
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




struct UserCommentView: View {
    var work : Work
    @State var isCollect = false
    var body: some View {
        VStack {
            HStack {
                WorkUserInfo(work:work,user:userData[0])
                Spacer()
                Spacer()
                Spacer()
                
                Button(action:{
                    isCollect = !isCollect
                }){
                    if isCollect == false {
                        Image(systemName: "heart")
                            .font(.system(size: 25))
                            .padding(.trailing,0.015*W)
                            .foregroundColor(.gray)
                    }
                    else {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 25))
                            .padding(.trailing,0.015*W)
                            .foregroundColor(.red)
                    }
                }
                
            }.frame(maxWidth:0.9*W)
            }
            
            HStack{
                Text(work.content)
                    .padding(.leading,0.01*W)
                Spacer()
            }.frame(maxWidth:0.9*W)
            
            HStack {
                Spacer()
                Image(work.workImg)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:0.9*W,height: 0.9*W)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Spacer()
            }.frame(width:0.9*W)
        }
    }


struct StateBar: View {
    @State var work:Work
    @State var isLike : Bool = false
    @State var isEditCommendOpened = false
    var comments : [Comment] = commentData
    var body: some View {
        HStack{
            Button(action: {
                if isLike == false {
                    self.work.likes += 1
                }
                else {
                    self.work.likes -= 1
                }
                isLike = !isLike
            }){
                VStack{
                    if isLike == false {
                        Image(systemName: "hand.thumbsup")
                            .padding(.leading,0.1*W)
                    }
                    else {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.red)
                            .padding(.leading,0.1*W)
                    }
                    }
                
            }.animation(.easeInOut(duration:0.5))
                .foregroundColor(.gray)

            
            
            Text(work.likes.description)
            Spacer()
            ///文本输入的sheet
            Image(systemName: "text.bubble")
                .onTapGesture {
                    self.isEditCommendOpened.toggle()
                }
                .sheet(isPresented: $isEditCommendOpened) {
                        CommendView()
                    }
                
            Text(comments.count.description)
                .padding(.trailing,0.1*W)
        }
        .frame(maxWidth:0.9*W)
        .font(.system(size: 19))
        
    }
}

struct CommenterView: View {
    var work : Work
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Image("0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 0.08*W, height: 0.08*W)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.gray, lineWidth: 0.003*W))
                    .padding(.top,0.015*W)
                    .padding(.bottom,0.02*W)
                    .padding(.leading,0.02*W)
                    .padding(.trailing,0.02*W)
                
                HStack{
                    Text("wo ")
                        .font(.system(size: 13))
                    Text(work.createdAt)
                        .font(.system(size: 12))
                        .bold()
                        .foregroundColor(.gray)
                    
                }.frame(minWidth:0.3*W,alignment: .leading)
                
                Spacer()
                
            }.frame(width:0.9*W)
            
            
            HStack{
                Text("1")
                    .padding(.leading,0.015*W)
                Spacer()
            }.frame(width:0.9*W)
                
                .padding(.bottom,0.01*W)
        }.background(Color(#colorLiteral(red: 0.9564109445, green: 0.9565709233, blue: 0.9563898444, alpha: 1)))
        
    }
}



struct WorkDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetail(work: workData[0])
    }
}
