//
//  ChallengeChatRoomBubblesView.swift
//  RChat
//
//  Created by Andrew Morgan on 19/05/2021.
//

import SwiftUI
import RealmSwift

struct ChallengeChatRoomBubblesView: View {
    @EnvironmentObject var state: AppState
    @ObservedResults(ChatMessage.self, sortDescriptor: SortDescriptor(keyPath: "timestamp", ascending: true)) var chats
    
//    var conversation: Conversation?
//    var isPreview = false
    
    @State private var realmChatsNotificationToken: NotificationToken?
    @State private var latestChatId = ""
    
    private enum Dimensions {
        static let padding: CGFloat = 8
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ScrollViewReader { (proxy: ScrollViewProxy) in
                    VStack {
                        ForEach(chats) { chatMessage in
                            ChatBubbleView(chatMessage: chatMessage,
                                           authorName: chatMessage.author != state.user?.userName ? chatMessage.author : nil)
                        }
                    }
                    .onAppear {
                        scrollToBottom()
                        withAnimation(.linear(duration: 0.2)) {
                            proxy.scrollTo(latestChatId, anchor: .bottom)
                        }
                    }
                    .onChange(of: latestChatId) { target in
                        withAnimation {
                            proxy.scrollTo(target, anchor: .bottom)
                        }
                    }
                }
            }
            Spacer()
//            if let user = state.user {
//                if isPreview {
//                    ChatInputBox(send: sendMessage, focusAction: scrollToBottom)
//                } else {
            ChatInputBox(send: sendMessage, focusAction: scrollToBottom)
//                    .environment(\.realmConfiguration, challengeApp.currentUser!.configuration(partitionValue: "user=\(user._id)"))
//                }
//            }
        }
        .navigationBarTitle("Detectives Chat", displayMode: .inline)
        .padding(.horizontal, Dimensions.padding)
        .onAppear { loadChatRoom() }
        .onDisappear { closeChatRoom() }
    }
    
    private func loadChatRoom() {
        scrollToBottom()
        realmChatsNotificationToken = chats.thaw()?.observe { _ in
            scrollToBottom()
        }
    }
    
    private func closeChatRoom() {
        if let token = realmChatsNotificationToken {
            token.invalidate()
        }
    }
    
    private func sendMessage(chatMessage: ChatMessage) {
//        guard let conversataionString = conversation else {
//            print("comversation not set")
//            return
//        }
        chatMessage.conversationId = state.user?.userName ?? "unknown"
        $chats.append(chatMessage)
    }
    
    private func scrollToBottom() {
        latestChatId = chats.last?._id ?? ""
    }
}

//struct ChallengeChatRoomBubblesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeChatRoomBubblesView()
//    }
//}
