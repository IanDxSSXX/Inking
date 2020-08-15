//
//  Stores.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import Foundation
import SwiftUI
import UIKit


class CardStore: ObservableObject {
    @Published var cards : [Card] = []
    @Published var cardDatas : [CardData] = []
    @Published var isSucceed = false

    init() {
        getCards()
        
    }
    
    func getCards(){
        self.cards = cardData
    }
    
    

}

class WorkStore: ObservableObject {
    lazy var collectedWorks : [Work] = []
    @Published var works : [Work] = []
    

    ///getMyWorks, getUsersWorks
    init() {
        getUserWorks()
    }
    
    func getUserWorks(){
        for i in 0..<workData.count {
            works.append(workData[i])
        }
    }
    
    func collectThisWork(work : Work) {
        collectedWorks.append(work)
    }
    
    func decollectThisWork(work : Work){
        let whichdelete = [work]
        collectedWorks = collectedWorks.filter { !whichdelete.contains($0) }
    }
    
    func isCollected(work : Work) -> Bool {
        for index in collectedWorks {
            if index == work {
                return true
            }
        }
        print("没有找到此收藏")
        return false
    }
    
           
    
    
    
}

class CommentStore: ObservableObject {
    @Published var comments : [Comment] = []
    @Published var isSucceed = false

    init(work: Work) {
        getComment(work: work)

    }
    func getComment(work: Work){

        }
    }


class UserStore: ObservableObject {
    @Published var users : [User] = []
    @Published var userDatas : [UserData] = []
    @Published var isSucceed = false

    init() {
        getUsers()
        
    }
    func getUsers(){
        for i in 0..<userData.count {
            users.append(userData[i])
        }
    }

    

}

