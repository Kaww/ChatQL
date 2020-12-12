# ChatQL

This app is a very simple live chat made with GraphQL subscription using Apollo iOS.

The API used have been developped by Chimezie Enyinnaya. [Link to his Github's repository](https://github.com/ammezie/graphql-chat-app).

Do refer to his repository's readme for setup instructions.

## Apollo + iOS

I'm using Apollo to manage the GraphQL business on the app side, installed with Swift Package Manager.

The setup not very complicated, but I faced some tricky steps as it was new to me.

You should follow the [iOS setup guide](https://www.apollographql.com/docs/ios/installation/) from Apollo's official documentation, especially for the code generation script.

## Codegen and SwiftUI preview

The codegen is preventing the app preview to refresh automatically.
To fix that I just followed [these tips](https://www.apollographql.com/docs/ios/installation/#advanced-codegen-tips-and-tricks) from Apollo's official documentation.

## Misc

While embeding my stack in a ScrollView embeded in a NavigationView, I found that there was a glitch when scrolling, also reporded an fixed [in the StackOverflow question](https://stackoverflow.com/questions/64280447/scrollview-navigationview-animation-glitch-swiftui).

Here is why I had to add a padding `.padding(.top, 1)` on my ScrollView. 

```swift
NavigationView {
    ScrollView {
        LazyVStack {
            ForEach(viewModel.chat) { message in
                MessageView(message: message)
            }
        }
    }
    .padding(.top, 1)
    .navigationBarTitle("Chat", displayMode: .automatic)
}
```
