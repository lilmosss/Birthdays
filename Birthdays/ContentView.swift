//
//  ContentView.swift
//  Birthdays
//
//  Created by Lily Mosisa on 4/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Caroline", birthday:.now),
        Friend(name: "McKinley", birthday: Date(timeIntervalSince1970: 0)),
        Friend(name: "Lily", birthday: Date(timeIntervalSince1970: 0))
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        List(friends, id: \.name) { friend in
            HStack{
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            }
        }
        .padding()
        .navigationTitle("Birthdays")
        .safeAreaInset(edge: .bottom){
            VStack(alignment: .center, spacing: 20) {
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                }
                Button("Save") {
                    let newFriend = Friend(name: newName, birthday: newBirthday)
                    friends.append(newFriend)
                    newName = ""
                    newBirthday = .now
                }
                .bold()
            }
            .padding()
            .background(.bar)
            }
        }
    }
    #Preview {
        ContentView()
    
}
