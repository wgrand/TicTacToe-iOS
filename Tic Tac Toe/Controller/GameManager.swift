//
//  GameManager.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import Foundation

class GameManager: ObservableObject {
  @Published var tiles: [TileType] = [
    .empty, .empty, .empty, .empty,
    .empty, .empty, .empty, .empty,
    .empty, .empty, .empty, .empty,
    .empty, .empty, .empty, .empty
  ]

  @Published var turn: TileType = .x

  func tileTapped(index: Int) {
    print("Tile \(index) tapped")
    if tiles[index] == .empty {
      tiles[index] = turn
      turn = turn == .x ? .o : .x
    }
  }
}
