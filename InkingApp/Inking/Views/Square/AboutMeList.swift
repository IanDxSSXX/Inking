//
//  AboutMeList.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct AboutMeList: View {
    var works : [Work] = workData
    var commenters : [User] = userData
    var comments : [Comment] = commentData
    var body: some View {
        ZStack{
                List{
                    ForEach(works.indices){index in
                        AboutMeSingle(work : self.works[index], commenter : commenters[index], comment : comments[index])
                    }
                    .listRowInsets(EdgeInsets())
                    .onAppear{
                        UITableView.appearance().separatorStyle = .none
                        }
                    }
                    
                }
        }
    
}



struct AboutMeList_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeList()
    }
}

