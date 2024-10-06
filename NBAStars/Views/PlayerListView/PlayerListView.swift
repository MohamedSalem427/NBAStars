//
//  ContentView.swift
//  NBAStars
//
//  Created by Mohamed Salem on 05/10/2024.
//

import SwiftUI

struct PlayerListView: View {
    @ObservedObject var viewModel: PlayerListViewModel
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.players) { player in
                        Text(player.name)
                    }
                    .onDelete { self.viewModel.delete(at: $0.first!) }
                }
                Button("Load Sample Data") { self.viewModel.loadSampleData() }
            }
            .navigationBarTitle("Players")
            .navigationBarItems(trailing: Button("Add") { self.showingAddView.toggle() })
            .sheet(isPresented: $showingAddView) { PlayerDetailsView() }
        }
    }
    
}
  
