//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
   
   @EnvironmentObject var gameViewModel: GameViewModel
   @Environment(\.colorScheme) var colorScheme

   var body: some View {
      VStack {
         Text(LocalizedStringKey("title"))
         Spacer()
         HStack {
            Spacer()
            Text(LocalizedStringKey("current_player_title"))
            Text("\(gameViewModel.turn == .x ? "X" : "O")")
            Spacer()
         }
         GridView()
            .padding()
         Spacer()
         Button(LocalizedStringKey("newgame_button_title")) {
            gameViewModel.reset()
         }
         .buttonStyle(GrowingButton())
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
