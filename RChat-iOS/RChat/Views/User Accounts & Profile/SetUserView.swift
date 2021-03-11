//
//  SetUserView.swift
//  RChat
//
//  Created by Andrew Morgan on 10/03/2021.
//

import SwiftUI
import RealmSwift

struct SetUserView: View {
    @EnvironmentObject var state: AppState
    @ObservedResults(User.self) var users
    @Environment(\.realm) var userRealm
    
    var body: some View {
        Text("Signing in")
            .onAppear {
                guard let user = users.first else {
                    print("Trying to set user when no user in realm")
                    return
                }
                do {
                    try userRealm.write {
                        guard let thawedUser = user.thaw() else {
                            print("Unable to thaw user")
                            return
                        }
                        print("About to set presence")
                        thawedUser.presenceState = .onLine
                        print("Presence set")
                        state.user = user
                        print("Stored user")
                    }
                } catch {
                    print("Unable to open Realm write transaction")
                }
            }
    }
}

struct SetUserView_Previews: PreviewProvider {
    static var previews: some View {
        SetUserView()
    }
}
