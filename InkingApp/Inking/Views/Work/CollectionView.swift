//
//  CollectionView.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        WorkList(works: WorkStore().works, user: userData[0]).zIndex(-1)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
