//
//  ContentView.swift
//  UIViewRepresentable
//
//  Created by 김건우 on 10/24/23.
//

import UIKit
import SwiftUI

struct ContentView: View {
    
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(inputText)
                Spacer()
                Button("Clear") {
                    inputText = ""
                }
            }
            TextView(input: $inputText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
