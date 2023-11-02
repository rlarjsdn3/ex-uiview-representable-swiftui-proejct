//
//  ContentView.swift
//  UIViewRepresentable
//
//  Created by 김건우 on 10/24/23.
//

import UIKit
import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    UIViewRepresentableView()
                        .navigationTitle("UIViewRepresentable")
                } label: {
                    Text("UIViewRepresentable")
                }
                
                NavigationLink {
                    UIViewControllerRepresentableView()
                        .navigationTitle("UIVCRepresentable")
                } label: {
                    Text("UIViewControllerRepresentable")
                }
            }
            .navigationTitle("UIVCRepresentable")
        }
    }
}

#Preview {
    ContentView()
}
