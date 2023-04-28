//
//  WinDelegate.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/28/23.
//

import Foundation

/// A protocol that defines the functions needed to determine if a player has won the game
protocol WinDelegateProtocol {
   
   func getBoard(from tiles: [Tile], size: Int) -> [[Player]]
   
   func vertical(_ p: Player, on board: [[Player]]) -> [[Player]]?
   func horizontal(_ p: Player, on board: [[Player]]) -> [[Player]]?
   func diagonal(_ p: Player, on board: [[Player]]) -> [[Player]]?
   func fourCorners(_ p: Player, on board: [[Player]]) -> [[Player]]?
   func twoByTwo(_ p: Player, on board: [[Player]]) -> [[Player]]?
   
   func all(tiles: [Tile], size: Int, player: Player) -> [[Player]]?
   
}

/// A class that handles the logic for determining if a player has won the game
class WinDelegate : WinDelegateProtocol {
   
   // MARK: Helper functions
   func getBoard(from tiles: [Tile], size: Int) -> [[Player]] {
      
      var board = [[Player]](repeating: [Player](repeating: .empty, count: size), count: size)
      
      _ = tiles.enumerated().map { (index, tile) in
         let row = index / size
         let col = index % size
         board[row][col] = tile.player
      }
      
      return board
      
   }
   
   func getBlankMatrix(size: Int) -> [[Player]] {
      [[Player]](repeating: [Player](repeating: .empty, count: size), count: size)
   }
   
   
   // MARK: Wins
   
   /// Checks for a win in the vertical columns of the board
   func vertical(_ p: Player, on board: [[Player]]) -> [[Player]]? {
      
      let size = board.count
      var w = getBlankMatrix(size: size)
      
      for col in 0..<size {
         var didFindWin = true
         for row in 0..<size {
            if board[row][col] != p {
               didFindWin = false
               break
            }
         }
         if didFindWin {
            (0..<size).forEach { w[$0][col] = p }
            return w
         }
      }
      
      return nil
      
   }
   
   
   /// Checks for a win in the horizontal rows of the board
   func horizontal(_ p: Player, on board: [[Player]]) -> [[Player]]? {
      
      let size = board.count
      var w = getBlankMatrix(size: size)
      
      // traverse vertically until we find a player
      for row in 0..<size where board[row][0] == p { // found possible win, traverse downward to verify
         
         var didFindWin = true

         for col in 0..<size {
            if board[row][col] != p {
               didFindWin = false
               break
            }
         }
         
         if didFindWin {
            (0..<size).forEach { w[row][$0] = p }
            return w
         }
      }
      
      return nil
   }
   
   
   /// Checks for a win in the two diagonals of the board
   func diagonal(_ p: Player, on board: [[Player]]) -> [[Player]]? {
      
      let size = board.count
      
      var w = getBlankMatrix(size: size)
      
      // check top-left to bottom-right
      var isWin = true
      for i in 0..<size where board[i][i] != p {
         isWin = false
         break
      }
      
      if isWin {
         (0..<size).forEach { w[$0][$0] = p }
         return w
      }
      
      // check bottom-left to top-right
      isWin = true
      for i in 0..<size where board[i][size - 1 - i] != p {
         isWin = false
         break
      }
      
      if isWin {
         (0..<size).forEach { w[$0][size - 1 - $0] = p }
         return w
      }
      
      return nil
      
   }
   
   
   /// Checks for a win in the four corners of the board
   func fourCorners(_ p: Player, on board: [[Player]]) -> [[Player]]? {
      
      let size = board.count
      
      if board[0][0] == p
            && board[size - 1][0] == p
            && board[0][size - 1] == p
            && board[size - 1][size - 1] == p {
         
         var w = getBlankMatrix(size: size)
         w[0][0] = p
         w[size - 1][0] = p
         w[0][size - 1] = p
         w[size - 1][size - 1] = p
         return w
      }
      
      return nil
   }
   
   
   
   func twoByTwo(_ p: Player, on board: [[Player]]) -> [[Player]]? {
      
      let size = board.count
      
      // traverse by row
      for v in 1..<size {
         
         // traverse by column
         for u in 1..<size {
            
            if board[v][u] == p,
               board[v][u-1] == p,
               board[v-1][u] == p,
               board[v-1][u-1] == p {
               var w = getBlankMatrix(size: size)
               w[v][u] = p
               w[v][u - 1] = p
               w[v - 1][u] = p
               w[v - 1][u - 1] = p
               return w
            }
         }
      }
      return nil
   }
   
   
   func all(tiles: [Tile], size: Int, player p: Player) -> [[Player]]? {
      
      let board = getBoard(from: tiles, size: size)
      
      if let win = vertical(p, on: board) ??
            horizontal(p, on: board) ??
            diagonal(p, on: board) ??
            fourCorners(p, on: board) ??
            twoByTwo(p, on: board) {
         return win
      }
      
      return nil
      
   }
   
   
}
