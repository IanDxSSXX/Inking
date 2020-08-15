//
//  CardView3.swift
//  Inking1.0
//
//  Created by 段奕含 on 4/12/20.
//  Copyright © 2020 段奕含. All rights reserved.
//

import SwiftUI
import UIKit

struct CardList: View {
    @State var cardState = CGSize.zero
    @State var detailState = CGSize.zero
    @State var cardnum = 0
    @State var showFront = true
    @State var showBack = false
    @State var showWhich = false
    @State var isDetailed = false
    @State var animateH = true
    @State var cards = cardData
//    @ObservedObject var store = dataStore()

    var body: some View {
        ZStack{
            if cards.count > 0{
                ZStack{
                    CardDetial(card: cards[cardnum])
                        .zIndex(4)
                        .frame(width:  W)
                        //隐藏在最下方
                        .offset(y: isDetailed ? detailState.height:2000)
                        .animation(.easeInOut(duration: 0.5))
                        .gesture(
                            DragGesture().onChanged{value in
                                //动画不隐藏
                                self.animateH = false
                                self.detailState = value.translation
                            }
                            .onEnded{value in
                                
                                //拖拽复原
                                if value.translation.height >= 0.22*H{
                                    self.isDetailed = false
                                }
                                self.detailState = .zero
                                
                        })
                    
                CirclePublish()
                        .offset(y: isDetailed ? detailState.height:800)
                        .zIndex(5)
                    
                CircleView(card: $cards[1])
                        .offset(y: isDetailed ? detailState.height:800)
                        .zIndex(5)
                    
                }.zIndex(4)
                

            }
            
            CardSingle(cardnum: showWhich ?  cardnum+1:cardnum-1,cards:$cards, isDetailed: $isDetailed)
                .zIndex( showBack ? 2:1)
                .frame(width:W)
                .rotation3DEffect(Angle(degrees:isDetailed ? -20 : 0), axis: (x: 10, y: 0, z: 0))
                .offset(x: -cardState.width,y: isDetailed ? -0.4*H + detailState.height: 0)
                .frame(width: isDetailed ? W : 0.9*W)
                .scaleEffect(isDetailed ? 1-detailState.height/H : 1 - abs(cardState.width/W))
                .animation(animateH ? nil: .easeInOut(duration: 0.5))
            
            
            
            CardSingle(cardnum: cardnum,cards:$cards, isDetailed: $isDetailed)
                .zIndex( showFront ? 3:0 )
                .frame(width:showFront ? W : 0)
                .rotation3DEffect(Angle(degrees:isDetailed ? -20 : 0), axis: (x: 10, y: 0, z: 0))
                .offset(x: cardState.width,y: isDetailed ? -0.4*H + detailState.height: 0)
                .scaleEffect(isDetailed ? 1-detailState.height/H : 1 - abs(cardState.width/W))
                .animation(isDetailed ? .easeInOut(duration: 0.5) : animateH ? nil: .easeInOut(duration: 0.5))
                
                
                .onTapGesture {
                    //点击动画不隐藏
                    self.animateH = false
                    //允许进入
                    self.cards[self.cardnum].isOpen = true
            }
                
                
            .gesture(
                DragGesture().onChanged{value in
                    //刚开始拖动画不隐藏
                    self.animateH = false
                    self.cardState = value.translation
                    if self.cardState.width > 0 {
                        self.showWhich=false
                        
                    }else{
                        self.showWhich=true
                    }
                    self.showBack = true
                }
                .onEnded{value in
                    //左滑
                    if self.cardState.width > 0.4*W && self.cardnum > 0{
                        self.showFront = false
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.45) {
                            //延时动画隐藏
                            self.animateH = true
                            
                            //更换卡片
                            self.cardnum -= 1
                            self.showBack = false
                            self.showFront = true
                            
                        }
                        
                    }//右滑
                    else if self.cardState.width < -0.4*W  && self.cardnum < self.cards.count-1{
                        self.showFront = false
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.45) {
                            self.animateH = true
                            self.cardnum += 1
                            self.showBack = false
                            self.showFront = true
                            
                        }
                    }else{
                        //后面归位
                        self.showBack = false
                    }
                    self.cardState = .zero
            })
        }
    }
}

//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
//


struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
        
    }
}
