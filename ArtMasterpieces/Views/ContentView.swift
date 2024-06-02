//
//  ContentView.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 27.05.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ViewModel()
    @State private var searchText = ""

    // Filter artists by name for search feature
    var filteredArtists: [Artist] {
        guard !searchText.isEmpty else { return viewModel.artisrs }
        return viewModel.artisrs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(pinnedViews: .sectionHeaders) {
                    // Display filtered artists
                    ForEach(filteredArtists, id: \.image) { artist in
                        NavigationLink(destination: WorksView(artist: artist)) {
                            ArtistDetailedView(artist: artist)
                        }
                    }
                }
                .padding()
                .navigationTitle("ArtApp")
            }
        }
        .tint(Color(.label))
        // Search feature
        .searchable(text: $searchText)
        .task {
            do {
                try await viewModel.fetchArtists()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
