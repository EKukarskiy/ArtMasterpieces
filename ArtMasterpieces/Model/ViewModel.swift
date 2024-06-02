//
//  ViewModel.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 27.05.2024.
//

import Foundation

// MARK: - View Model

@MainActor
final class ViewModel: ObservableObject {

    @Published var artisrs = [Artist]()

    let provider = NetworkProvider()

    func fetchArtists() async throws {
        var fetchedArtists: [Artist]
        fetchedArtists = try await provider.getArtists()
        artisrs = fetchedArtists
    }
}
