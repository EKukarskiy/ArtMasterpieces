//
//  NetworkProvider.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 27.05.2024.
//

import Foundation

// MARK: - Network Layer

actor NetworkProvider {
    func getArtists() async throws -> [Artist] {
        var artists = [Artist]()

        guard let url = URL(string: "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json") else {
            throw ArtistError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ArtistError.invalidResponse
        }

        guard let decodedArtists = try? JSONDecoder().decode(Query.self, from: data) else {
            throw ArtistError.decodingError
        }

        artists = decodedArtists.artists
        return artists
    }
}

// MARK: - Errors

enum ArtistError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
