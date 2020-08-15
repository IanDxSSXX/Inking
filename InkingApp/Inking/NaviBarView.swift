//
//  SwiftUIView.swift
//  Reconstruction
//
//  Created by Tony Feng on 2020/7/18.
//  Copyright © 2020 StarStudio. All rights reserved.
//

import SwiftUI

//TODO：黑暗模式改颜色的代码
//static var lightGray = UIColor { (trait) -> UIColor in
//    if trait.userInterfaceStyle == .light{
//        return UIColor(red: 60/255, green: 60/255, blue: 76/255, alpha: 1)
//    } else {
//        return UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)
//    }
//}
struct NaviBarView: View {
//    @ObservedObject var model = NaviBarViewModel()

    let homeView = CardList()
    let squraView = Square()
    let publishView = PenHomeView()
    let meView = UserView(user: userData[3])
    @State var tabSelection: Int = 0
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = UIColor(named: "White")
        appearance.backgroundColor = UIColor(named: "Whitey")
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

    }



    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
            homeView
                .tabItem { Item(index: $tabSelection, style: .home) }
                .tag(0)
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
//                .edgesIgnoringSafeArea(.all)

            squraView
                .tabItem { Item(index: $tabSelection, style: .globe) }
                .tag(1)
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())

//                .edgesIgnoringSafeArea(.all)

            publishView
                .tabItem { Item(index: $tabSelection, style: .pencil) }
                .tag(2)
                .navigationBarHidden(true)
//                .navigationViewStyle(StackNavigationViewStyle())

            meView
                .tabItem { Item(index: $tabSelection, style: .person) }
                .tag(3)
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())

            }
            
            .accentColor(.primary)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
//            .navigationBarItems(trailing: model.tabNavigationBarTrailingItems)
//            .navigationBarTitle(model.tabNavigationTitle, displayMode: .inline)
//            .environmentObject(model)
//            .navigationViewStyle(StackNavigationViewStyle())

        }
        .navigationViewStyle(StackNavigationViewStyle())

    }

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NaviBarView()
    }
}

private struct Item: View {
    @Binding var index: Int
    
    let style: Style
    
    var body: some View {
        VStack {
            if index == style.rawValue {
                style.selectedImage.font(.system(size: iconSize))
            } else {
                style.image.font(.system(size: iconSize*0.85))

            }
            
            Text(style.text)
        }
    }
}

extension Item {
//init一些乱七八糟的外观，放出来看起来代码整洁一些
    enum Style: Int {
        case home
        case globe
        case pencil
        case person
        
        var image: Image {
            switch self {
            case .home:    return Image(systemName: "house")
            case .globe:   return Image(systemName: "globe")
            case .pencil:  return Image(systemName: "pencil.circle")
            case .person:  return Image(systemName: "person.circle")
            }
        }
        
        //如果后期需要选中不选中的图片不一样的话，这里可以直接改，这里选的和原来一样
        var selectedImage: Image {
            switch self {
            case .home:    return Image(systemName: "house")
            case .globe:   return Image(systemName: "globe")
            case .pencil:  return Image(systemName: "pencil.circle")
            case .person:  return Image(systemName: "person.circle")
            }
        }
        
        var text: String {
            switch self {
            case .home:     return "主页"
            case .globe:    return "广场"
            case .pencil:   return "练字"
            case .person:   return "我"//TODO：这里我不知道最后那个该叫啥，先写个“我” 吧
            
            }
        }
    }
}



//    init() {
//        UITabBar.appearance().isTranslucent = false
//        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//    }

