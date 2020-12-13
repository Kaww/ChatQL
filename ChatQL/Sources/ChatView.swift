//
//  ContentView.swift
//  ChatQL
//
//  Created by KAWRANTIN LE GOFF on 12/12/2020.
//

import SwiftUI

var screen = UIScreen.main.bounds

struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.chat) { message in
                            switch message.from {
                            case viewModel.config.me:
                                MeMessageBubbleView(message: message)
                            case viewModel.config.friend:
                                FriendMessageBubleView(message: message)
                            default:
                                Text("Unknown")
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 70)
                }
                .padding(.top, 1)
                .navigationBarTitle(viewModel.config.friend, displayMode: .automatic)
                .navigationBarItems(trailing:
                                        Button(action: viewModel.switchUser, label: { Text("Switch user") })
                )
            }
            
            ComposeBarView(viewModel: viewModel)
        }
    }
}

struct ComposeBarView: View {
    @State var viewModel: ChatViewModel
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 5) {
                ZStack {
                    RoundedRectangle(cornerRadius: barHeight / 2, style: .continuous)
                        .foregroundColor(Color(.darkGray))

                    TextField("", text: $message)
                        .foregroundColor(.white)
                        .frame(height: 35)
                        .padding(.horizontal, 10)
                }
                
                Button(
                    action: sendMessage,
                    label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 40, weight: .regular, design: .rounded))
                            .foregroundColor(Color(.darkGray))
                    }
                )
            }
            .frame(width: screen.width - 30, height: barHeight)
            .padding(.bottom, 5)
        }
    }
    
    private func sendMessage() {
        self.viewModel.send(message: self.message)
        self.message = ""
    }
    
    private let barHeight: CGFloat = 40
}

struct MeMessageBubbleView: View {
    @State var message: ChatViewModel.Message
    
    var body: some View {
        HStack {
            Color.clear.frame(width: 100)
            
            Text(message.message)
                .padding(10)
                .background(Color(UIColor.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .layoutPriority(0.9)
                .foregroundColor(.white)
        }
        .padding(.trailing, 10)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct FriendMessageBubleView: View {
    @State var message: ChatViewModel.Message
    
    var body: some View {
        HStack {
            Text(message.message)
                .padding(10)
                .background(Color("ChatFriendColor"))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .layoutPriority(0.9)
            Color.clear.frame(width: 100)
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: ChatViewModel(isPreview: true))
            .preferredColorScheme(.dark)
    }
}
