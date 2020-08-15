//
//  PublishView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/21.
//

import Combine
import SwiftUI

struct PublishView: View {
    @State var shufa = UIImage()
    
    @State var note = "分享你的感受"
    @State var image: Image? = Image("Publish")
    @State var image_2: Image? = Image(systemName: "camera")
    @State var showImagePicker: Bool = false
    @State var placeholderString = "分享你的感受"
    @State var sourceType : Int = 1
    
    var body: some View {
        VStack(spacing: 0.18*W){
            //测试界面
//            Image(uiImage: shufaImag).zIndex(-2).frame(maxWidth:  70, maxHeight:70)
            Spacer()
            Spacer()
//            if words == "分享你的感受" {
//                TextEditor(text: $words)
//                    .foregroundColor(.secondary)
//                    .frame(width:0.9*W)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .shadow(radius: 20)
//            }
//            else {
                
                TextEditor(text: self.$note)
                          .foregroundColor(self.note == placeholderString ? .gray : .primary)
                          .onTapGesture {
                            if self.note == placeholderString {
                              self.note = ""
                            }
                          }
//                TextEditor(text: $words)
//                    .foregroundColor(.primary)
//                    .frame(width:0.9*W)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .shadow(radius: 20)
//            }

//
//            TextField("分享你的感受", text: $words)
//                .frame(width:0.9*W)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .shadow(radius: 20)
            HStack{
                Spacer()

                NavigationLink(
                    destination: PhotoPickerView(image: $shufa),
                    label: {
                        Rectangle()
                            .frame(width:0.4*W,height: 0.4*W)
                            .foregroundColor(Color("Lighter Grey"))
                            .cornerRadius(20)
                            .overlay(
                                Image(systemName:"camera")
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                    .font(.system(size:59))
                            )
                    } ).buttonStyle(PlainButtonStyle())
                
                Button(action: {self.hideKeyboard()}) {
                         Rectangle()
                        .frame(width:0.4*W,height: 0.4*W)
                        .foregroundColor(Color("Lighter Grey"))
                        .cornerRadius(20)
                        .overlay(Text("发布").font(.custom("Hanzipen", size: 30)))}
                
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()

//            Spacer()



            


        }
        .offset(y:0.1*H)
//        .sheet(isPresented: $showImagePicker){
//            Text("选择tup")
////            ImagePicker(isShown: self.$showImagePicker, image: self.$image,sourceType:self.$sourceType)
//        }
        .frame(width:W, height: 1.1*H)
        .background(Color("Background White"))
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

//struct PublishView_Previews: PreviewProvider {
//    static var previews: some View {
//        PublishView(shufaImag: <#UIImage#>)
//    }
//}
//
