//
//  Square.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import SwiftUI

struct Square: View {
    @State var page = 0
    @State var position = CGSize.zero
    
    var body: some View {
        VStack{
            SquareHeader(page:$page).zIndex(1)
        Spacer(minLength: W*0.1)
        HStack(spacing:0){
            RecommandView().frame(width:W).zIndex(-1)
            ConcernView().frame(width:W).zIndex(-1)
            CollectionView().frame(width:W).zIndex(-1)
            AboutMeList().frame(width:W).zIndex(-1)        }
        .offset(x: CGFloat(3-self.page*2)/2*W + position.width)
        .gesture(DragGesture().onChanged{value in
            self.position = value.translation
        }.onEnded{value in
            if self.page == 0 && value.translation.width < -0.4*W{
                self.page = 1
            }else if self.page == 1 && value.translation.width < -0.4*W{
                self.page = 2
            }else if self.page == 2 && value.translation.width < -0.4*W{
                self.page = 3
            }else if self.page == 3 && value.translation.width > 0.4*W{
                self.page = 2
            }else if self.page == 2 && value.translation.width > 0.4*W{
                self.page = 1
            }else if self.page == 1 && value.translation.width > 0.4*W{
                self.page = 0
            }
            self.position = .zero
            
            
        })
        .frame(width:4*W)
        }.animation(.easeInOut)
    }
    
}

    




struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Square()
    }
}



struct SquareHeader: View {
    @Binding var page : Int
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                self.page = 0
            }){
                VStack{
                    Text("推荐")
                        .frame(minWidth:0.2*W)
                    if self.page == 0{
                        Rectangle()
                            .frame(width: 0.2*W,height: 2)
                    }
                }
            }
            .animation(.easeInOut(duration:0.5))
            .foregroundColor(.gray)
            
            Spacer()
            Button(action: {
                self.page = 1
                
            }){
                VStack{
                    Text("关注")
                        .frame(minWidth:0.2*W)
                    if self.page == 1{
                        Rectangle()
                            .frame(width: 0.2*W,height: 2)
                    }
                }
            }.animation(.easeInOut(duration:0.5))
                .foregroundColor(.gray)
            
            Spacer()
            Spacer()
            
            Button(action: {
                self.page = 2
            }){
                VStack{
                    Text("收藏")
                        .frame(minWidth:0.2*W)
                    if self.page == 2{
                        Rectangle()
                            .frame(width: 0.2*W,height: 2)
                    }
                }
            }
            .animation(.easeInOut(duration:0.5))
                //颜色
                .foregroundColor(.gray)
            
            Spacer()
            Button(action: {
                self.page = 3
                
            }){
                VStack{
                    Text("相关")
                        .frame(minWidth:0.2*W)
                    if self.page == 3{
                        Rectangle()
                            .frame(width: 0.2*W,height: 2)
                    }
                }
            }.animation(.easeInOut(duration:0.5))
                .foregroundColor(.gray)
            
            Spacer()
            
        }.frame(maxWidth:W)
    }
}
