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
      
      LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: gameViewModel.dimen), spacing: 0) {

         ForEach($gameViewModel.tiles) { tile in
            
            Button { 
                gameViewModel.tileTapped(tile: tile.wrappedValue)
              } label: {
                TileView(tile: tile.wrappedValue)
            }

         }
         
      }
      .border(.gray)
      .background(Color.gridBackground)
      
   }
}

struct GridView_Previews: PreviewProvider {
   
   static var previews: some View {
      GridView()
         .environmentObject(GameViewModel())
   }
}