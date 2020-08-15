//
//  CommendView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct RecommandView: View {
    var body: some View {
        SqureWorkList(works: WorkStore().works).zIndex(-1)
    }
}

struct ReCommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandView()
    }
}
