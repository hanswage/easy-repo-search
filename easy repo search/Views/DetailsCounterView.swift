//
//  DetailsCounterView.swift
//  easy repo search
//
//  Created by Hans Wage on 09/02/2023.
//

import SwiftUI

struct DetailsCounterView: View {
    let systemIcon: String
    let counterName: String
    let counterValue: Int?
    
    var body: some View {
        let watchers = String.init(format: "%d %@", counterValue ?? 0, counterName)
        
        HStack(spacing: 14) {
            Image(systemName: systemIcon)
                .frame(width: 30)
            
            Text(watchers)
            
            Spacer()
        }
    }
}

struct DetailsCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCounterView(systemIcon: "star", counterName: "stars", counterValue: 0)
    }
}
