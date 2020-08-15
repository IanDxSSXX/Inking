//
//  SwiftUIView.swift
//  Inking
//
//  Created by Tony Feng on 2020/8/11.
//

import SwiftUI
import Combine


struct PenHomeView: View {
    @State var shufaImag = UIImage()
    @State var image: Image? = Image("Publish")

    var body: some View {
        VStack
        {
            Spacer()
            NavigationLink(
                destination: DrawView(shufaImag: $shufaImag),
                label: {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 0.4*W, height:  0.4*W)
                        .font(.system(size: 30))
                        .cornerRadius(25)
                        .shadow(radius: 20)
                }).buttonStyle(PlainButtonStyle())
            Spacer()

        }
    }
}

