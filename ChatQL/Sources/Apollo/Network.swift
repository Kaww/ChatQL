//
//  Network.swift
//  ChatQL
//
//  Created by KAWRANTIN LE GOFF on 12/12/2020.
//

import Apollo
import ApolloWebSocket
import Foundation

class Apollo {
    static let shared = Apollo()
    
    private let url = URL(string: "http://localhost:4000/")!
    
    /// Create a client using the `SplitNetworkTransport`.
    private(set) lazy var client = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store)
    
    /// A split network transport to allow the use of both of the above
    /// transports through a single `NetworkTransport` instance.
    private lazy var splitNetworkTransport = SplitNetworkTransport(
        uploadingNetworkTransport: self.normalTransport,
        webSocketNetworkTransport: self.webSocketTransport
    )
    
    /// An HTTP transport to use for queries and mutations
    private lazy var normalTransport: RequestChainNetworkTransport = {
        return RequestChainNetworkTransport(interceptorProvider: LegacyInterceptorProvider(store: self.store), endpointURL: url)
    }()
    
    /// A web socket transport to use for subscriptions
    private lazy var webSocketTransport: WebSocketTransport = {
        let request = URLRequest(url: url)
        return WebSocketTransport(request: request)
    }()
    
    private var store = ApolloStore()
}
