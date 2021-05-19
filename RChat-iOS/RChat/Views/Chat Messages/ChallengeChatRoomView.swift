//
//  ChallengeChatRoomView.swift
//  RChat
//
//  Created by Andrew Morgan on 19/05/2021.
//

import SwiftUI

struct ChallengeChatRoomView: View {
    @EnvironmentObject var state: AppState
//    @Environment(\.realm) var userRealm
//    var conversation: Conversation?
//    var isPreview = false
    
    let padding: CGFloat = 8
    
    var body: some View {
        VStack {
//            if let conversation = conversation {
//                if isPreview {
//                    ChatRoomBubblesView(conversation: conversation, isPreview: isPreview)
//                } else {
            ChallengeChatRoomBubblesView()
                .environment(\.realmConfiguration, challengeApp.currentUser!.configuration(partitionValue: "conversation=\(state.user?.userName ?? "unknow")"))
//                }
            }
            Spacer()
//        }
        .navigationBarTitle(" Detectives Chat", displayMode: .inline)
        .padding(.horizontal, padding)
//        .onAppear(perform: clearUnreadCount)
//        .onDisappear(perform: clearUnreadCount)
    }
    
//    private func clearUnreadCount() {
//        if let conversationId = conversation?.id {
//            if let conversation = state.user?.conversations.first(where: { $0.id == conversationId }) {
//                do {
//                    try userRealm.write {
//                        conversation.unreadCount = 0
//                    }
//                } catch {
//                    print("Unable to clear chat unread count")
//                }
//            }
//        }
//    }
}

//struct ChallengeChatRoomView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeChatRoomView()
//    }
//}
