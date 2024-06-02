//
//  WorkDetailedView.swift
//  ArtMasterpieces
//
//  Created by Evgeniy K on 28.05.2024.
//

import SwiftUI

struct WorkDetailedView: View {

    let work: Artist.Works

    enum WorksDetailedConstants {
        static let textLineSpacing: CGFloat = 6
        static let viewCornerRadius: CGFloat = 20
        static let viewShadowRadius: CGFloat = 30
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(work.title)
                    .textCase(.uppercase)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.vertical)

                Image(work.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)

                Divider()

                Text(work.info)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.center)
                    .lineSpacing(WorksDetailedConstants.textLineSpacing)
                    .padding()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: WorksDetailedConstants.viewCornerRadius))
            .shadow(radius: WorksDetailedConstants.viewShadowRadius)
        }
    }
}

#Preview {
    WorkDetailedView(work: Artist.testArtist().works[0])
}
