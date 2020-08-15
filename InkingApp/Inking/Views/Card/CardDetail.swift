//
//  CardDetial.swift
//  Inking1.0
//
//  Created by 段奕含 on 4/13/20.
//  Copyright © 2020 段奕含. All rights reserved.
//

import SwiftUI

struct CardDetial: View {
    
    var card : Card

    @State var isActive = false
    @State var circleState = CGSize.zero
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width:0.96*W,height:0.85*H)
                    .foregroundColor(Color("Background White"))
                
                VStack {
                    Text(card.details)
                        .font(.custom(font1, size: 27))
                    
                    Spacer()
                }
                .frame(maxWidth:0.9*W, maxHeight:0.6*H)
                
                
            }.frame(height:0.9*H)
            
        
        
    }
}

struct CardDetial_Previews: PreviewProvider {
    static var previews: some View {
        CardDetial(card: cardData[0])
    }
}
