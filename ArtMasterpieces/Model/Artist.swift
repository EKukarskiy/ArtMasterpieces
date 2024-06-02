//
//  Artist.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 27.05.2024.
//

import Foundation

// MARK: - JSON Model

struct Artist: Decodable, Hashable {
    let name: String
    let bio: String
    let image: String
    let works: [Works]

    struct Works: Decodable, Hashable {
        let title: String
        let image: String
        let info: String
    }
}

// MARK: - JSON Query

struct Query: Decodable {
    let artists: [Artist]
}

// MARK: - Preview Data

extension Artist {
    static func testArtist() -> Artist {
        let artist = Artist(name: "Rembrandt",
                            bio: "Rembrandt Harmenszoon van Rijn (15 July 1606 - 4 October 1669) was a Dutch painter and etcher. He is generally considered one of the greatest painters and printmakers in European art and the most important in Dutch history.",
                            image: "6",
                            works: [Artist.Works(title: "Belshazzar's Feast",
                                                 image: "Rembrandt1",
                                                 info: "Belshazzar's Feast is a painting by Rembrandt housed in the National Gallery, London. The painting is an attempt to establish Rembrandt as a painter of large, baroque history paintings."),
                                    Artist.Works(title: "The Night Watch",
                                                 image: "Rembrandt2",
                                                 info: "Militia Company of District II under the Command of Captain Frans Banninck Cocq, also known as The Shooting Company of Frans Banning Cocq and Willem van Ruytenburch, but commonly referred to as The Night Watch (Dutch: De Nachtwacht), is a 1642 painting by Rembrandt van Rijn. It is in the collection of the Amsterdam Museum but is prominently displayed in the Rijksmuseum as the best known painting in its collection."),
                                    Artist.Works(title: "Syndics of the Drapers' Guild",
                                                 image: "Rembrandt3",
                                                 info: "The Sampling Officials (Dutch: De Staalmeesters), also called Syndics of the Drapers' Guild, is a 1662 oil painting by Rembrandt. It is currently owned by the Rijksmuseum in Amsterdam. It has been described as his 'last great collective portrait'."),
                                    Artist.Works(title: "Jacob de Gheyn III", image: "Rembrandt4", info: "Jacob de Gheyn III, also known as Jacob III de Gheyn (1596â€“1641), was a Dutch Golden Age engraver, son of Jacob de Gheyn II, canon of Utrecht (city), and the subject of a 1632 oil painting by Rembrandt. The portrait is half of a pair of pendent portraits. The other piece is a portrait of de Gheyn's friend Maurits Huygens, wearing similar clothing (ruffs and black doublets) and facing the opposite direction.")])
        return artist
    }
}
