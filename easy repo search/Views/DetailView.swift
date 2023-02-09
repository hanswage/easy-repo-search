//
//  DetailView.swift
//  easy repo search
//
//  Created by Hans Wage on 06/02/2023.
//

import SwiftUI

struct DetailView: View {
    let gitHubItem: GitHubItem?
    
    var body: some View {
        Text(gitHubItem?.fullName ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gitHubItem: nil)
    }
}
