//
//  ChatViewModel.swift
//  ChatQL
//
//  Created by KAWRANTIN LE GOFF on 12/12/2020.
//

import Foundation
import Apollo

class ChatViewModel: ObservableObject {
    
    @Published var chat = Chat()
    @Published var config: Config
    
    private var subscription: Cancellable?
    
    init(isPreview: Bool = false, me: String = "Kaww", friend: String = "Gael") {
        config = Config(me: me, friend: friend)
        
        if isPreview {
            self.chat = mockedChatData()
        } else {
            setupSubscription()
            fetchChat()
        }
    }
    
    
    func switchUser() {
        config = Config(me: config.friend, friend: config.me)
    }
    
    deinit {
        self.subscription?.cancel()
    }
    
    /// Aliases for extremely long Apollo types
    public typealias Chat = [GetChatQuery.Data.Chat]
    public typealias Message = GetChatQuery.Data.Chat
    
    struct Config {
        let me: String
        let friend: String
    }
}

// MARK: Utils
extension ChatViewModel {

    private func cleanedChats(_ items: [Message?]) -> Chat {
        var result = Chat()
        for item in items {
            if let unwrappedItem = item {
                result.append(unwrappedItem)
            }
        }
        return result
    }
}

// MARK: Networking {
extension ChatViewModel {
    
    private func setupSubscription() {
        subscription = Apollo.shared.client.subscribe(subscription: ChatSubscription()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                if let messageSentResult = graphQLResult.data?.messageSent {
                    let messageSent = Message(id: messageSentResult.id, from: messageSentResult.from, message: messageSentResult.message)
                    self.chat.append(messageSent)
                }
                
            case .failure(let error):
                print("CHAT SUBSCRIPTION ERROR \(error)")
            }
        }
    }
    
    func fetchChat() {
        Apollo.shared.client.fetch(query: GetChatQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let chatResult = graphQLResult.data?.chats {
                    self.chat = self.cleanedChats(chatResult)
                }
                
            case .failure(let error):
                print("CHAT FETCH ERROR: \(error)")
            }
        }
    }
    
    func send(message: String) {
        let mutation = SendMessageMutation(from: config.me, message: message)
        Apollo.shared.client.perform(mutation: mutation) { result in
            print(result)
        }
    }
}

// MARK: Mocked Data
extension ChatViewModel {
    
    private func mockedChatData() -> Chat {
        return [
            Message(id: 0, from: "Kaww", message: "Message 1"),
            Message(id: 1, from: "Gael", message: "Message 2")
        ]
    }
}

// MARK: Identifiable
extension GetChatQuery.Data.Chat: Identifiable {}
