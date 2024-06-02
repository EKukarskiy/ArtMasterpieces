//
//  WorksView.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 27.05.2024.
//

import SwiftUI

struct WorksView: View {

    let artist: Artist

    enum WorksConstants {
        static let viewCornerRadius: CGFloat = 20
        static let viewOpacity: Double = 0.8
        static let viewShadowRadius: CGFloat = 1

        static let imageWidth: CGFloat = 300
        static let imageHeight: CGFloat = 300
    }

    var body: some View {
        ScrollView {
            ForEach(artist.works, id: \.title) { work in
                NavigationLink(destination: WorkDetailedView(work: work)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: WorksConstants.viewCornerRadius)
                            .fill(Gradient(colors: [.gray, .white]))
                            .clipShape(.rect(cornerRadius: WorksConstants.viewCornerRadius))
                            .overlay(
                                RoundedRectangle(cornerRadius: WorksConstants.viewCornerRadius)
                                    .fill(.ultraThinMaterial).opacity(WorksConstants.viewOpacity))
                            .shadow(radius: WorksConstants.viewShadowRadius)

                        Image(work.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: WorksConstants.imageWidth, height: WorksConstants.imageHeight)
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    WorksView(artist: Artist.testArtist())
}
