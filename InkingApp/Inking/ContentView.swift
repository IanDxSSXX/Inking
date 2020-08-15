//
//  ContentView.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/19.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    
    init() {
        UITabBar.appearance().isTranslucent = false
        if colorScheme == .dark {
            UITabBar.appearance().barTintColor =  #colorLiteral(red: 0.08580293506, green: 0.0858252123, blue: 0.08580001444, alpha: 1)
        }
        if colorScheme != .dark {
            UITabBar.appearance().barTintColor = #colorLiteral(red: 0.9127784967, green: 0.9129316211, blue: 0.9127582908, alpha: 1)
        }

    }
    var body: some View {
        NavigationView {
        VStack{
        TabView{
            
            CardList()
                .tabItem{
                    NavItem(itemName: "house")
                }
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.bottom)


                
            
            Square()
                .tabItem{
                    NavItem(itemName: "globe")
                }
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.bottom)


            
//            DrawView()
//                .tabItem{
//                    NavItem(itemName: "pencil.circle")
//            }
//                .edgesIgnoringSafeArea(.bottom)

            
            
            UserView(user: userData[3])
                .tabItem{
                    NavItem(itemName: "person.circle")
                }
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.bottom)


                
        }
        .accentColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)


        }
        .edgesIgnoringSafeArea(.bottom)

        }.navigationViewStyle(StackNavigationViewStyle())
        
        
        
        
    }
}

struct NavItem: View {
    var itemName : String
    var body: some View {
        VStack{
//            Spacer(minLength: 0.3*W)
            Image(systemName: itemName)
                .font(.system(size: 30))
                .foregroundColor(.clear)
        }
        
    }
}


