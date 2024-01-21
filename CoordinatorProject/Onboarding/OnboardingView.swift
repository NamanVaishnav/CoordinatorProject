//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import SwiftUI

struct OnboardingView: View {
    var doneRequested: () -> ()
    var body: some View {
        TabView {
            ScaledImageView(name: "cat")
                .tag(0)
            ScaledImageView(name: "lama")
                .tag(1)
            ScaledImageView(name: "rose")
                .tag(2)
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black.ignoresSafeArea(.all))
        
    }
}

#Preview {
    OnboardingView(doneRequested: {})
}
