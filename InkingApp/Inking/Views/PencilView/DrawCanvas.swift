//
//  DrawConovas.swift
//  Inking
//
//  Created by Tony Feng on 2020/8/1.
//

import SwiftUI
import Combine
import PencilKit
import UIKit

class DrawCoordinator : NSObject, PKCanvasViewDelegate {
    var parent: DrawCanvas
    
    init(_ uiView: DrawCanvas) {
        self.parent = uiView
    }
    
    func canvasViewDrawingDidChange(_ drawView: PKCanvasView) {
        // 输出到父界面
        self.parent.drawing = drawView.drawing
    }
}


struct DrawCanvas: UIViewRepresentable {
    @Binding var drawing : PKDrawing
    @Binding var toolStates : Int
    
    func makeCoordinator() -> DrawCoordinator {
        DrawCoordinator(self)
    }
    
    func makeUIView(context: Context) -> PKCanvasView {
        let canvas = PKCanvasView(frame: .init(x: 0, y: 0, width: W, height: 0.9*H))
        canvas.isOpaque = false
        canvas.backgroundColor = .clear
        // 配置工具箱,自带的风格不太一样，隐藏
//        let toolpicker = PKToolPicker()
//        toolpicker.addObserver(canvas)
//        toolpicker.setVisible(true, forFirstResponder: canvas)
        canvas.drawingPolicy = .anyInput
        if toolStates == 0{
            canvas.tool = PKEraserTool(.bitmap)
        }
        if toolStates == 1{
            canvas.tool = PKInkingTool(.pen, color: UIColor.red,width: 5)
        }
        canvas.becomeFirstResponder()
        canvas.delegate = context.coordinator // 关键。设了才能得到输出！
        // 来自父界面的输入
        canvas.drawing = drawing
        canvas.isScrollEnabled = true
        return canvas
    }
    
    func updateUIView(_ canvas: PKCanvasView, context: Context) {
    }
}
