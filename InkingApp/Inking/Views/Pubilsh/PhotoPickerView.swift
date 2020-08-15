//
//  PhotoPickerView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/28.
//

import UIKit
import SwiftUI

struct PhotoPickerView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var isShowPhotoLibrary = false
    @Binding var image : UIImage
    @State var isFromCam = false
    
    var body: some View {
        VStack {
            
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                Button(action: {
                    self.isFromCam = true
                    self.isShowPhotoLibrary = true
                    
                }) {
                    HStack {
                        Image(systemName: "camera")
                            .font(.system(size: 20))
                            
                        Text("从相机拍取")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.clear)
                    .foregroundColor(.primary)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }.zIndex(2)
                
                Spacer()
                
                Button(action: {
                    self.isFromCam = false
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                            
                        Text("从相册选择")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.clear)
                    .foregroundColor(.primary)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }.zIndex(2)
            }
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
        .sheet(isPresented: $isShowPhotoLibrary) {
            if isFromCam == false {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
            else {
                ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
        }
    }
}

//struct PhotoPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoPickerView()
//    }
//}


