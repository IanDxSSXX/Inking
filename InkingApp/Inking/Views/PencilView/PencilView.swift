//
//  PencilView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/25.
//

import SwiftUI
import Combine
import PencilKit
import UIKit

//let imgRect = CGRect(width: 400, height: 80)
//let image = canvasView.drawing.image(from: imgRect, scale: 1.0)


struct DrawView: View {
    @State var ifOffset = false
    @Binding var shufaImag : UIImage

    @State private var selectFonts = Fonts.宋体
//    @Binding var shufaImag : UIImage
    
    @State private var showGradeView = false

    @State private var selectedPic = 0
    @State var isShowPicker = false
    @State var drawing = PKDrawing()
//    drawing.bounds
    @State var isShown = false
    @State var picName = "ShuFa"
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.undoManager) var undoManager
    @State var toolState : Int = 1
    var body: some View {
        NavigationLink(destination: GradeView(drawing: $drawing, selectFonts: $selectFonts), isActive: $showGradeView) {
            EmptyView()
        }

//        ZStack{
        if isShowPicker == true {
            
            Picker("选择字体？？？", selection: $selectFonts) {
                
                Text("宋体").tag(Fonts.宋体)
                Text("黑体").tag(Fonts.黑体)
                Text("楷体").tag(Fonts.楷体)
                Text("草书").tag(Fonts.草书)
                Text("行书").tag(Fonts.行书)
                Text("仿宋").tag(Fonts.仿宋)
                Text("行草").tag(Fonts.行草)

            }
            .accentColor(.red)
            .foregroundColor(.blue)
            .labelsHidden()
            .zIndex(4)
//                            .pickerStyle( )
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        }
        
        
        VStack{
            Divider()
            
            if toolState == 1{
                DrawCanvas(drawing: $drawing, toolStates: $toolState)
//                    .background(backFrame)
            }
            
            else {
                DrawCanvas(drawing: $drawing, toolStates: $toolState)
//                    .background(backFrame)
            }
        }
        .onTapGesture {
            self.isShowPicker = false
        }
        .background(backFrame)
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(leading:
            HStack{
//                Spacer()
                HStack {
                    
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                    }
                    Spacer(minLength: 50)

                    Button(action:{toolState = 1}){
                        if toolState == 1 {
                            Image("pencil.fill")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                                .foregroundColor(.black)

                        }
                        else {
                            Image("pencil")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.trailing, 20)
                    Button(action:{toolState = 0}){
                        if toolState == 0 {
                            Image("era.fill")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                                .foregroundColor(.black)
                        }
                        else {
                            Image("era")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.trailing, 20)
//                    Spacer()
                    Button(action:{self.undoManager?.undo()}) {
                        Image(systemName: "arrow.turn.up.left")
                            .resizable()
                            .frame(minWidth:36)
                    }.foregroundColor(.primary)
                    Spacer(minLength: W*0.03)
                    Button(action:{self.undoManager?.redo()}) {
                        Image(systemName: "arrow.turn.up.right")
                            .resizable()
                            .frame(minWidth:36)
                    }.foregroundColor(.primary)

                    .sheet(isPresented: $isShown) {
                        ZStack{
//                            Image("ShuFa")
//                                .resizable()
                            ShowView(drawing: $drawing)
                        }
                     }
                    Spacer(minLength: 20)
                    Text("更多")
//                        .padding(.trailing)
//                        .sheet(isPresented: $isShowPicker){
//                            Picker("", selection: $selectFonts) {
//
//                                Text("宋体").tag(Fonts.宋体)
//                                Text("黑体").tag(Fonts.黑体)
//                                Text("楷体").tag(Fonts.楷体)
//                                Text("草书").tag(Fonts.草书)
//                                Text("行书").tag(Fonts.行书)
//                                Text("仿宋").tag(Fonts.仿宋)
//                                Text("行草").tag(Fonts.行草)
//
//                            }
//                            .labelsHidden()
//                            .zIndex(2)
////                            .pickerStyle( )
//                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
//
//                            Text("Selected flavor: \(selectFonts.rawValue)").zIndex(2)
//                        }
                        .contextMenu {
                            //显示预览界面
                            Button(action: {
                                self.isShown.toggle()
                            }) {
                                Text("欣赏作品")
                                Image(systemName: "newspaper")
                            }.padding(.trailing, 20)
                            .foregroundColor(.primary)

                            Button(action: {
                                self.isShowPicker.toggle()
                            }) {
                                Text("更改字体")
                                Image(systemName: "textformat")
                            }
                            
                            
                            Button(action: {
                                self.showGradeView = true
                            }) {
                                Text("提交字帖")
                                Image(systemName: "paperplane")
                            }
                            Button(action: {
                                shufaImag = drawing.image(from: drawing.bounds, scale: 1)
                                //提交字体的函数
                            }) {
                                Text("发布作品")
                                Image(systemName: "paperplane")
                            }
                        }
                    Spacer()

 

                }.padding(.top, 10)

//                Spacer(minLength: W*0.6)
            })
//    }
    }

    private var backFrame: some View{
        ZStack{
        if !isShowPicker {
            Image("\(selectFonts.rawValue)")
                .resizable()
                .frame(width: W, height: H*0.9, alignment: .center)
        }
        else {
            Image("\(selectFonts.rawValue)")
                .resizable()
                .frame(width: W, height: H*0.9, alignment: .center)
                .offset(y: H*0.079)
        }
//            .foregroundColor(.white)
//            .shadow(color: .gray, radius: 2, x: 3, y: 3)
        }
    }

}




struct ShowView: View {
//    @State private var showDrawView: Bool = false
    // PencilKit相关的model应以PKDrawing为基本对象，需要导出时再用.image()或.dataRepresentation() 转换
    @Binding var drawing : PKDrawing
    var body: some View {
        VStack{
            Image(uiImage: drawing.image(from: drawing.bounds, scale: 1) )
//                .resizable().frame(width:600, height: 800).border(Color.blue)
//            Button("画板"){
//                self.showDrawView.toggle()
//            }
//            .sheet(isPresented: self.$showDrawView) {
//                DrawView(isShown: self.$showDrawView)
//            }
        }
    }
}



