//
//  CommendView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/21.
//

import SwiftUI
import UIKit

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct CommendView: View {
    @State var textInput: String = ""
    @State var oneText = ""
    
    var body: some View {
        Spacer()
        VStack{
            
            Text("请输入您的评论：")
                .padding()
            TextInputView(textInput: $textInput)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }.frame(height:H*0.9)
        .background(Color.clear)
        .cornerRadius(8)
        .padding()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
//            VStack {
//            Text("测试界面:")
//                .padding()
//            Divider()
//            Text("\(textInput)")
//            Spacer()
//        }.frame(height:300)
//            .background(Color.green)
//            .cornerRadius(8)
//            .padding()
//
    }
}

struct CommendView_Previews: PreviewProvider {
    static var previews: some View {
        CommendView()
    }
}

///Swift无多行输入框，自定义一个
struct TextInputView: UIViewRepresentable {
    @Binding var textInput: String
        
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        
        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
        
        return myTextView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = textInput
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: TextInputView
        
        init(_ uiTextView: TextInputView) {
            self.parent = uiTextView
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            print("text now: \(String(describing: textView.text!))")
            self.parent.textInput = textView.text
        }
    }
}
