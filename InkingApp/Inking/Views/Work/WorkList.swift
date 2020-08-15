//
//  WorkList.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import SwiftUI

struct WorkList: View {
    var works: [Work]
    var user: User
    var body: some View {
        ScrollView{
        LazyVStack(alignment:.leading){
                if works.count>1{
                    ForEach(0...Int(works.count/2)-1,id: \.self) {i in
                        HStack(spacing:0.03*W){
                            Spacer()
                            WorkSingle(work: works[2*i], user: user)
                            WorkSingle(work: works[2*i+1], user: user)
                            Spacer()
                        }
                    }
                }
                /// 剩下一个判断是不是单独的
                HStack(spacing:0.03*W) {
                    if works.count % 2 != 0{
                        WorkSingle(work: works[works.count-1], user: user)
                            .padding(.leading, W*0.065)
                    }
                }
            }
        
        }
    }
}

//struct WorkList_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkList()
//    }
//}

struct SqureWorkList: View {
    var works: [Work]
    var users: [User] = userData

    var body: some View {
        ScrollView{
        LazyVStack(alignment:.leading){
                if works.count>1{
                    ForEach(0...Int(works.count/2)-1,id: \.self) {i in
                        
                        HStack(spacing:0.03*W){
                            Spacer()
                            WorkSingle(work: works[2*i], user: users[i])
                            WorkSingle(work: works[2*i+1], user: users[3])
                            Spacer()
                        }
                    }
                }
                /// 剩下一个判断是不是单独的
                HStack(spacing:0.03*W) {
                    if works.count % 2 != 0{
                        WorkSingle(work: works[works.count-1], user: users[4])
                            .padding(.leading, W*0.065)
                    }
                }
            }
        }
    }
}
