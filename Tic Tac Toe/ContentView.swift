//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Tic Tac Toe")
      GridView()
      Button("New Game") {
        print("New Game")
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
