//
//  CallRommViewModel.swift
//  Picsart Academy iOS Task (Suren Poghosyan)
//
//  Created by Suren Poghosyan on 22.11.23.
//

import Foundation


final class CallRoomViewModel {
    var onChange: (() -> Void)!
    
    private(set) var usersList: [User] = [] {
        didSet {
            onChange()
        }
    }
    
    
    func addUser(user: User) {        
        if !usersList.contains(where: { $0.title == user.title }) {
            usersList.append(user)
            print("User added: \(user.title)")
        } else {
            print("something went wrong at addUser")
        }
    }
    
    func removeUser(user: User) {
        if let index = usersList.firstIndex(where: { $0.title == user.title }) {
            usersList.remove(at: index)
            print("User removed: \(user.title)")
        } else {
            print("something went wrong at removeUser")
        }
    }
    
    func removeLastUser() {
        if !usersList.isEmpty {
            usersList.removeLast()
        } else {
            print("usersList is empty")
        }
        
    }
    
}
