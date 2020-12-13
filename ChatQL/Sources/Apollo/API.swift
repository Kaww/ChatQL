// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetChatQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetChat {
      chats {
        __typename
        id
        from
        message
      }
    }
    """

  public let operationName: String = "GetChat"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("chats", type: .list(.object(Chat.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(chats: [Chat?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "chats": chats.flatMap { (value: [Chat?]) -> [ResultMap?] in value.map { (value: Chat?) -> ResultMap? in value.flatMap { (value: Chat) -> ResultMap in value.resultMap } } }])
    }

    public var chats: [Chat?]? {
      get {
        return (resultMap["chats"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Chat?] in value.map { (value: ResultMap?) -> Chat? in value.flatMap { (value: ResultMap) -> Chat in Chat(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Chat?]) -> [ResultMap?] in value.map { (value: Chat?) -> ResultMap? in value.flatMap { (value: Chat) -> ResultMap in value.resultMap } } }, forKey: "chats")
      }
    }

    public struct Chat: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Chat"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("from", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, from: String, message: String) {
        self.init(unsafeResultMap: ["__typename": "Chat", "id": id, "from": from, "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var from: String {
        get {
          return resultMap["from"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "from")
        }
      }

      public var message: String {
        get {
          return resultMap["message"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }
    }
  }
}

public final class ChatSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription Chat {
      messageSent {
        __typename
        id
        from
        message
      }
    }
    """

  public let operationName: String = "Chat"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("messageSent", type: .object(MessageSent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(messageSent: MessageSent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "messageSent": messageSent.flatMap { (value: MessageSent) -> ResultMap in value.resultMap }])
    }

    public var messageSent: MessageSent? {
      get {
        return (resultMap["messageSent"] as? ResultMap).flatMap { MessageSent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "messageSent")
      }
    }

    public struct MessageSent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Chat"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("from", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, from: String, message: String) {
        self.init(unsafeResultMap: ["__typename": "Chat", "id": id, "from": from, "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var from: String {
        get {
          return resultMap["from"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "from")
        }
      }

      public var message: String {
        get {
          return resultMap["message"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }
    }
  }
}

public final class SendMessageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendMessage($from: String!, $message: String!) {
      sendMessage(from: $from, message: $message) {
        __typename
        id
        from
        message
      }
    }
    """

  public let operationName: String = "SendMessage"

  public var from: String
  public var message: String

  public init(from: String, message: String) {
    self.from = from
    self.message = message
  }

  public var variables: GraphQLMap? {
    return ["from": from, "message": message]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sendMessage", arguments: ["from": GraphQLVariable("from"), "message": GraphQLVariable("message")], type: .object(SendMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendMessage: SendMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendMessage": sendMessage.flatMap { (value: SendMessage) -> ResultMap in value.resultMap }])
    }

    public var sendMessage: SendMessage? {
      get {
        return (resultMap["sendMessage"] as? ResultMap).flatMap { SendMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "sendMessage")
      }
    }

    public struct SendMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Chat"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("from", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, from: String, message: String) {
        self.init(unsafeResultMap: ["__typename": "Chat", "id": id, "from": from, "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var from: String {
        get {
          return resultMap["from"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "from")
        }
      }

      public var message: String {
        get {
          return resultMap["message"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }
    }
  }
}
