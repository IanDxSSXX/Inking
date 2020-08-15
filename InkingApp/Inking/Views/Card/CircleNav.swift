//
//  CircleNav.swift
//
//  Created by Tony Feng on 2020/7/18.
//  Copyright © 2020 StarStudio. All rights reserved.
//

import SwiftUI

struct CirclePublish: View {
    @State var position = CGSize.zero
    @State var showPublishView = 0.0
    var body: some View {
        HStack {
            PublishView()
                .offset(x: -0.915*W + position.width + CGFloat(showPublishView))
            Circle().foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
//            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .frame(width:0.16*W,height:0.16*W )
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .overlay(
                    Image(systemName:"pencil")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .font(.system(size:30))
                )
                .offset(x: -1.01*W + position.width + CGFloat(showPublishView))
                .gesture(DragGesture()
                .onChanged{ value in
                    self.position = value.translation
                    //为了保证浮在上面
                    self.showPublishView += 0.001
                }
                .onEnded{ value in
                    if value.translation.width > 0.2*W || (value.translation.width > -0.2*W && value.translation.width < 0){
                        self.showPublishView = Double(W)
                    }else{
                        self.showPublishView = Double(0)
                    }
                    
                    self.position = .zero
                    
                })
                .shadow(radius: 20)

            
            
        }
        .zIndex(showPublishView == 0 ? 5 :6)
        .animation(.easeInOut(duration: 0.5))
        
    }
}
struct CircleView: View {
    @State var position = CGSize.zero
    @State var showView = 0.0
    @Binding var card : Card
    @ObservedObject var workStore = WorkStore()
    var body: some View{
        HStack {
            
//            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), center: .center)
            Circle()
                .clipShape(Circle())
                .frame(width:0.16*W,height:0.16*W )
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .overlay(
                    Image(systemName:"list.bullet.indent")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .font(.system(size:25))
                )
                .offset(x: 1.01*W + position.width - CGFloat(showView))
                .gesture(DragGesture()
                .onChanged{ value in
                    self.position = value.translation
                    //为了保证浮在上面
                    self.showView += 0.001
                }
                .onEnded{ value in
                    if value.translation.width < -0.2*W || (value.translation.width < 0.2*W && value.translation.width > 0){
                        self.showView = Double(W)
                    }else{
                        self.showView = Double(0)
                    }
                    self.position = .zero

//                    self.$workStore.updateWorks(card: self.card)
                    
                    print(self.workStore.works)
                    
                    
                })
                .shadow(radius: 20)
                .zIndex(1)
            ZStack{
                Rectangle()
                    .frame(width:W, height: 1.1*H)
                    .offset(x: 0.915*W + position.width - CGFloat(showView))
                    .zIndex(0)
                    .foregroundColor(.clear)
                if self.workStore.works.count > 0 {
                    TodayView(works: workStore.works)
                        .offset(x: 0.915*W + position.width - CGFloat(showView))
                        .zIndex(0)
                }else {
                    Rectangle()
                        .frame(width:W, height: 1.1*H)
                        .offset(x: 0.915*W + position.width - CGFloat(showView))
                        .zIndex(0)
                        .foregroundColor(.clear)
                }
            }
        }
        .zIndex(showView == 0 ? 5 :6)
        .animation(.easeInOut(duration: 0.5))
    }
}


