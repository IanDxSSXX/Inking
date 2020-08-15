//
//  VIEWUITEST.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct VIEWUITEST: View {
    var body: some View {
        
        HStack(alignment: .bottom,spacing: 0){
            Image("1")
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
                Text("11111")
                    .frame(minWidth:0.2*W,alignment: .leading)
                    .font(.system(size: 13))
                    .foregroundColor(.primary)
                    .padding(.top,0.02*W)

                Text("222222")
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.gray)
                    .padding(.bottom,0.03*W)

            }
        }
        .frame(width: 0.35*W,height: 0.135*W)
        
        }
        
    }


struct VIEWUITEST_Previews: PreviewProvider {
    static var previews: some View {
        VIEWUITEST()
    }
}
