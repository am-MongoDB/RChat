//
//  WrappedLoginView.swift
//  RChat
//
//  Created by Andrew Morgan on 10/03/2021.
//

import SwiftUI
import RealmSwift

struct WrappedLoginView: View {
    @ObservedObject var app: RealmSwift.App
    var body: some View {
        if let user = app.currentUser {
            SetUserView()
                .environment(\.realmConfiguration, app.currentUser!.configuration(partitionValue: "user=\(user.id)"))
        } else {
            LoginView()
        }
    }
}

//  struct WrappedLoginView_Previews: PreviewProvider {
//      static var previews: some View {
//          WrappedLoginView(app: App)
//      }
//  }
