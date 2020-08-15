//
//  TodayView.swift
//  Inking
//
//  Created by Tony Feng on 2020/8/10.
//

import SwiftUI

struct TodayView: View {
    @State var goToWhich  = -1
    var works : [Work]

    var body: some View {
        VStack{
            WorkSingle(work: works[2], user: userData[0])
                .offset(y:0.1*H)
        }
        .frame(width:W, height: 1.1*H)
        .background(Color("Background White"))
     
    }
}
