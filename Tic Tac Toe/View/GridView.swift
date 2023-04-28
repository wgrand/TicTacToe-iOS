//
//  GridView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct GridView: View {
   
   @EnvironmentObject var gameViewModel: GameViewModel
   
   var body: some View {
      
      LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0),
                               count: gameViewModel.size), spacing: 0) {
         
         ForEach($gameViewModel.tiles) { tile in
            
            Button {
               gameViewModel.tileTapped(tile: tile.wrappedValue)
            } label: {
               TileView(tile: tile.wrappedValue)
            }
            
         }
         
      }
       .background(Color.gridBackground)
       .cornerRadius(10)
       .overlay(
         RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 2)
       )
       .alert(isPresented: $gameViewModel.isShowingEndGameAlert) {
          Alert(title: Text($gameViewModel.endGameText.wrappedValue),
                message: Text(LocalizedStringKey("endgame_alert_message")),
                primaryButton: .default(Text("endgame_alert_button_yes"), action: {
             gameViewModel.reset()
          }),
                secondaryButton: .cancel())
       }
      
   }
}

struct GridView_Previews: PreviewProvider {
   
   static var previews: some View {
      GridView()
         .environmentObject(GameViewModel())
   }
}
