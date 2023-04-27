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
   
   init(id: Int) {
      self.id = id
   }
   
}
