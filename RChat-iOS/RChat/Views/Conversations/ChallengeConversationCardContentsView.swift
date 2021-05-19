//
//  ChallengeConversationCardContentsView.swift
//  RChat
//
//  Created by Andrew Morgan on 19/05/2021.
//

import SwiftUI
import RealmSwift

struct ChallengeConversationCardContentsView: View {
    
    private struct Dimensions {
        static let mugWidth: CGFloat = 110
        static let cornerRadius: CGFloat = 5
        static let lineWidth: CGFloat = 1
        static let padding: CGFloat = 5
    }
    
    var chatMembers: [Chatster] {
        let chatsterList = [Chatster]()
//        for member in conversation.members {
//            chatsterList.append(contentsOf: chatsters.filter("userName = %@", member.userName))
//        }
        return chatsterList
    }
    
    var body: some View {
        HStack {
            MugShotGridView(members: chatMembers)
                .frame(width: Dimensions.mugWidth)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("Detectives")
//                    .fontWeight(conversation.unreadCount > 0 ? .bold : .regular)
//                CaptionLabel(title: conversation.unreadCount == 0 ? "" :
//                        "\(conversation.unreadCount) new \(conversation.unreadCount == 1 ? "message" : "messages")")
            }
            Spacer()
        }
        .padding(Dimensions.padding)
        .overlay(
            RoundedRectangle(cornerRadius: Dimensions.cornerRadius)
                .stroke(Color.gray, lineWidth: Dimensions.lineWidth)
        )
    }
}

struct ChallengeConversationCardContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeConversationCardContentsView()
    }
}
