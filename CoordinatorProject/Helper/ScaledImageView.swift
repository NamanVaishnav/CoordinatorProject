//
//  ScaledImageView.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            
    }
}

#Preview {
    ScaledImageView(name: "cat")
}
