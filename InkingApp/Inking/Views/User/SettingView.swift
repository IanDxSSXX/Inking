//
//  SettingView.swift
//  Reconstruction
//
//  Created by Tony Feng on 2020/7/19.
//  Copyright © 2020 StarStudio. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false

    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                Group {
                    NavigationLink(destination: UserSettingView()) {
                        Cell(title: "账号与安全")
                    }
                    Line()
                }
//                Group {
//                            Cell(title: "主题风格")
//                            Line()
//                        }

                Group {
//                    NavigationLink(destination: UserSettingView()) {
                        Cell(title: "目前版本 ： 1.0")
//                    }
                    Separator().padding(.leading, 0)
                    Cell(title: "检查更新")
                        .onTapGesture {
                            self.showingAlert = true
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("检查更新"), message: Text("目前已是最新版本！"), dismissButton: .default(Text("好的")))
                        }
                    Separator().padding(.leading, 0)
                    Cell(title: "给个好评")
                    Line()
                }
            }
            .background(Color.clear)
        }
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(leading:
                                ZStack{
                                    HStack{
                                        Spacer(minLength: 0.5*W)
                                        Text("设置")
                                        Spacer(minLength: 0.5*W)
                                    }
                                    HStack{
                                        Spacer()
                                        Button(action:{
                                            self.presentationMode.wrappedValue.dismiss()
                                        }){
                                            Image(systemName: "chevron.left")
                                            .foregroundColor(.primary)
                                        }
                                        Spacer(minLength: W*0.95)


                                    }
                                })

        
        .background(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.1))
        
}
}




private struct Cell: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding()
        }
        .frame(height: 54)
    }
}

//设置中间那里会用到的宽分割线
struct Line: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.1))
            .frame(height: 8)
    }
}

//设置中间那里会用到窄的分割线
struct Separator: View {
    
    var body: some View {
        Divider()
            .overlay(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.1))
            .padding(.zero)
    }
}

