//
//  CardView2.swift
//  Inking1.0
//
//  Created by 段奕含 on 4/12/20.
//  Copyright © 2020 段奕含. All rights reserved.
//

import SwiftUI



struct CardSingle: View {
    var cardnum : Int
    @Binding var cards : [Card]
    @Binding var isDetailed : Bool
    
    var body: some View {
        
        ZStack{
            if cardnum>=cards.count || cardnum<0{
                VStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width:0.9*W,height: 1.4*W)
                }
            }else
            {
                ZStack{
                    
                if cards[cardnum].isOpen {
                    ZStack{
                        
                        /// 信纸
                        Image("envPaper")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        /// 背景图
                        
                        Image(cards[cardnum].paperImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:0.2*W,height:0.32*W)
                            .clipped()
                            .cornerRadius(3)

                        
//                        switch (deviceIdiom) {
//
//                        case .pad:
//                            Image(cards[cardnum].paperImage)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width:0.1*W,height:0.1*W)
//                                .clipped()
//                                .cornerRadius(3)
//                        case .phone:
//                            Image(cards[cardnum].paperImage)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width:0.82*W,height:1.32*W)
//                                .clipped()
//                                .cornerRadius(3)
//                        case .tv:
//                            Image(cards[cardnum].paperImage)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width:0.82*W,height:1.32*W)
//                                .clipped()
//                                .cornerRadius(3)
//                        default:
//                            Text("error")
////                            Image(cards[cardnum].paperImage)
////                                .resizable()
////                                .aspectRatio(contentMode: .fill)
////                                .frame(width:0.82*W,height:1.32*W)
////                                .clipped()
////                                .cornerRadius(3)
//                        }
                        
                        
                        /// 内容
                        Text(cards[cardnum].content)
                            .font(.custom(font1, size: 30))
                            .foregroundColor(.black)
                            .lineLimit(6)
                            .frame(maxWidth:0.7*W)
                            .padding(.bottom,50)
                        /// 作者
                        HStack {
                            Spacer()
                            Text("——"+cards[cardnum].author)
                                .foregroundColor(.black)
                                .font(.custom(font1, size: 25))
                                .offset(y:0.4*W)
                                .padding(.trailing,30)
                        }
                        Text(cards[cardnum].date)
                            .font(.custom(font1, size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth:0.7*W)
                            .offset(x:-0.2*W,y: -0.5*W)
                        
                    }
//                    .animation(.easeInOut(duration: 0.5))
                    .shadow(radius: 20)
                    .onTapGesture {
                        self.isDetailed = true
                    }
                    
                }else{
                    Image("envlope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 20)
                        .onTapGesture {
                            cards[cardnum].isOpen = true
                        }
//                        .animation(.easeInOut(duration: 0.5))
                }
                } 


            }

        }
       .frame(width:0.9*W)
                
    }
    
}

struct CardSingle_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CardSingle(cardnum: 1 , cards: .constant(cardData),isDetailed: .constant(false))
    }
}


