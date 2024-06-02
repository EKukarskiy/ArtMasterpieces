//
//  ArtistDetailedView.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 27.05.2024.
//

import SwiftUI

struct ArtistDetailedView: View {

    let artist: Artist

    enum ArtistConstants {
        static let viewVSpacing: CGFloat = 5

        static let imageWidth: CGFloat = 100
        static let imageHeight: CGFloat = 100

        static let textVSpacing: CGFloat = 20
        static let textLineSpacing: CGFloat = 8
        static let textPadding: CGFloat = 8

        static let viewPadding: CGFloat = 7
        static let viewOpacity: Double = 0.9
        static let viewCornerRadius: CGFloat = 20
        static let viewShadowRadius: CGFloat = 20
    }

    var body: some View {
        VStack(spacing: ArtistConstants.viewVSpacing) {
            Image(artist.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .frame(width: ArtistConstants.imageWidth, height: ArtistConstants.imageHeight)

            VStack(alignment: .center, spacing: ArtistConstants.textVSpacing) {
                Text(artist.name)
                    .textCase(.uppercase)
                    .font(.body)
                    .fontWeight(.semibold)

                Text(artist.bio)
                    .font(.callout)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .lineSpacing(ArtistConstants.textLineSpacing)
            }
            .padding(ArtistConstants.textPadding)
        }
        .padding(ArtistConstants.viewPadding)
        .background(.black).opacity(ArtistConstants.viewOpacity)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: ArtistConstants.viewCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: ArtistConstants.viewCornerRadius)
                .stroke()
                .fill(.white.opacity(ArtistConstants.viewOpacity)))
        .shadow(radius: ArtistConstants.viewShadowRadius)
    }
}

#Preview {
    ArtistDetailedView(artist: Artist.testArtist())
}
