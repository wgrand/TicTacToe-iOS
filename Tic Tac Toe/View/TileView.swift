//
//  Tile.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct TileView: View {
   
   @ObservedObject var tile: Tile
   
   var body: some View {
      ZStack {
         Rectangle()
            .fill(Color.clear)
            .border(.gray)
            .aspectRatio(1, contentMode: .fit)
         switch(tile.tileType) {
         case .empty:
            EmptyView()
               .background(Color.purple)
         case .x:
            XView()
            
         case .o:
            OView()
            
         }
      }
   }
}

struct Tile_Previews: PreviewProvider {
   @ObservedObject static var tile: Tile = Tile(id: 0)
   static var previews: some View {
      TileView(tile: tile)
   }
}
