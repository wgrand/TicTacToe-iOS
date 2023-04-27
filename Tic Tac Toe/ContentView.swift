//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct ContentView: View {
   
   @EnvironmentObject var gameViewModel: GameViewModel
   @Environment(\.colorScheme) var colorScheme

   var body: some View {
      VStack {
         Text("Tic Tac Toe")
         Spacer()
         Text("Current Player: \(gameViewModel.turn == .x ? "X" : "O")")
         GridView()
            .padding()
         Button("New Game") {
            gameViewModel.create()
         }
         Spacer()
      }
      .background(Color.background)
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         .environmentObject(GameViewModel())
   }
}
