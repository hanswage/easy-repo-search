//
//  DetailView.swift
//  easy repo search
//
//  Created by Hans Wage on 06/02/2023.
//

import SwiftUI

struct DetailView: View {
    let name: String
    
    var body: some View {
        Text(name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name: "hanswage/easy-repo-search")
    }
}
