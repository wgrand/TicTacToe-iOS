//
//  Tile.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct TileView: View {
   
   @ObservedObject var tile: Tile
   @State var opacity = 1.0
   
   private let baseAnimation = Animation.easeInOut(duration: 1)
   
   var body: some View {
      
      ZStack {
         
         Rectangle()
            .fill(Color.clear)
            .border(.gray)
            .aspectRatio(1, contentMode: .fit)
         
         HStack {
            switch(tile.player) {
            case .empty:
               EmptyView()
               
            case .x:
               XView()
               
            case .o:
               OView()
               
            }
         }.opacity(opacity)
            .onChange(of: tile.isWin) {
               if $0 {
                  let repeated = baseAnimation.repeatForever(autoreverses: true)
                  withAnimation(repeated) { opacity = 0.2 }
               } else {
                  stopAnimation()
               }
            }
         
      }
      
   }
   
   func stopAnimation() {
      var transaction = Transaction()
      transaction.disablesAnimations = !tile.isWin
      
      withTransaction(transaction) {
         withAnimation {
            opacity = 1.0
         }
      }
   }
   
}

struct Tile_Previews: PreviewProvider {
   @ObservedObject static var tile: Tile = Tile(id: 0, player: .x)
   static var previews: some View {
      TileView(tile: tile)
   }
}
