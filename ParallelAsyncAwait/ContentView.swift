//
//  ContentView.swift
//  ParallelAsyncAwait
//
//  Created by Roberto Rojo Sahuquillo on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    //Redraw UI when it changes
    @StateObject private var viewModel = TestViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .task {
                    //Call viewModel method
                    viewModel.loadImages()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
