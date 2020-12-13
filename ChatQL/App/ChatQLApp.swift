//
//  ChatQLApp.swift
//  ChatQL
//
//  Created by KAWRANTIN LE GOFF on 12/12/2020.
//

import SwiftUI

@main
struct ChatQLApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView(viewModel: ChatViewModel())
        }
    }
}
