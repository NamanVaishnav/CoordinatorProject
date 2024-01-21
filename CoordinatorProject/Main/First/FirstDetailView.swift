//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        VStack {
            Text("First Detail")
            
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

#Preview {
    FirstDetailView(viewModel: FirstTabViewModel())
}
