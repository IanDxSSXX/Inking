//
//  ConcernView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct ConcernView: View {
    var body: some View {
        SqureWorkList(works: WorkStore().works).zIndex(-1)
    }
}

struct ConcernView_Previews: PreviewProvider {
    static var previews: some View {
        ConcernView()
    }
}
