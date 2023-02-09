//
//  RepoCellView.swift
//  easy repo search
//
//  Created by Hans Wage on 08/02/2023.
//

import SwiftUI

struct RepoCellView: View {
    let gitHubItem: GitHubItem?
    
    var body: some View {
        // Retrieving a 2x account image, so it will look good on retina
        let resizedImage = GitHubHelpers.setAvatarSize(
            withUrl: gitHubItem?.owner?.avatarUrl,
            size: 80)
        
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: resizedImage), scale: 2.0)
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .foregroundColor(Color.black)
            
            VStack(alignment: .leading) {
                Text(gitHubItem?.fullName ?? "")
                    .font(.system(size: 14))
                    .bold()
            }
        }
    }
}

struct RepoCellView_Previews: PreviewProvider {
    static var previews: some View {
        RepoCellView(gitHubItem: nil)
    }
}
