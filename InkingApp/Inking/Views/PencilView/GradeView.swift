//
//  GradeView.swift
//  Inking
//
//  Created by Tony Feng on 2020/8/1.
//

import SwiftUI
import Combine
import PencilKit

struct GradeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var drawing : PKDrawing
    @Binding var selectFonts : Fonts
    var body: some View {
        VStack{
            
            Spacer()

            ZStack{

                Image("\(selectFonts.rawValue)")
                    .resizable()
                    .frame(width: W*0.6, height: H*0.9*0.6)

                
                Image(uiImage: drawing.image(from: drawing.bounds, scale: 1) )
//                    .padding(.top,-H*0.2)
//                    .background(backFrame)
            }
            .frame(width: W*0.6, height: H*0.9*0.6)
            Spacer()
            
            Text("匹配得分：95分")
                .background(backFrame)
            Spacer()
            Text("打败了全国99%的人")
                .background(backFrame_1)
//            Spacer()
//            Text("匹配记录")
//                .background(backFrame_2)
            Spacer()





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
    private var backFrame: some View{
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .foregroundColor(Color("Normal Grey"))
            .frame(width: W*0.5, height: H*0.05)
            .shadow(color: .gray, radius: 2, x: 3, y: 3)

    }
    private var backFrame_1: some View{
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .foregroundColor(Color("Lighter Grey"))
            .frame(width: W*0.5, height: H*0.05)
            .shadow(color: .gray, radius: 2, x: 3, y: 3)

    }
    private var backFrame_2: some View{
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .foregroundColor(Color("Lighter Black"))
            .frame(width: W*0.5, height: H*0.05)
            .shadow(color: .gray, radius: 2, x: 3, y: 3)

    }



}
