//
//  PlayerDetailsView.swift
//  NBAStars
//
//  Created by Mohamed Salem on 06/10/2024.
//

import SwiftUI

struct PlayerDetailsView: View {
    @State var name = ""
    @State var isFavorite = false
    @State var birthDate = Date()
    @State var selectedTeamIndex = 0
    
    var teamNames = ["Bulls", "Lakers", "Knicks"]
    
    var body: some View {
        NavigationView {
            VStack {
                Image("person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                    .shadow(radius: 5)
                    .padding(.top)
                
                Form {
                    Section {
                        TextField("Name", text: $name)
                        Toggle(isOn: $isFavorite) { Text("Favorite?") }
                    }
                    Section {
                        Picker(selection: $selectedTeamIndex, label: Text("Team")) {
                            ForEach(0 ..< teamNames.count, id: \.self) {
                                Text(self.teamNames[$0])
                            }
                        }
                        DatePicker(selection: $birthDate) { Text("Birth Date") }
                    }
                }
            }
            .navigationBarTitle("Add New Player", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                
                
              }
            )
        }
    }
}
