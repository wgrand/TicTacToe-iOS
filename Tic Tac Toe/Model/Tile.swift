//
//  Tile.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/27/23.
//

import Foundation

class Tile: ObservableObject, Identifiable {
   
   let id: Int
   @Published var player: Player = .empty
   @Published var isWin = false
   
   init(id: Int, player: Player = .empty) {
      self.id = id
      self.player = player
   }
   
   func reset() {
      self.player = .empty
      self.isWin = false
   }
   
}
