//
//  GameViewModel.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import Foundation
import SwiftUI

@MainActor class GameViewModel: ObservableObject {
   
   private(set) var size: Int
   
   private var moveCount: Int
   
   @Published var tiles: [Tile]
   @Published private(set) var turn: Player = .x
   @Published var isShowingWin = false
   
   init(dimen: Int = 4) {
      self.size = dimen
      self.tiles = (0..<(dimen*dimen)).map { Tile(id: $0) }
      self.turn = .x
      self.moveCount = 0
   }
   
   convenience init() {
      self.init(dimen: 4)
   }
   
   func create() {
      tiles = (0..<(size*size)).map { Tile(id: $0) }
      turn = .x
      moveCount = 0
   }
   
   
   func tileTapped(tile: Tile) {
      
      // make sure we haven't already won
      guard moveCount < size*size else { return }
      
      let index = tiles.firstIndex(where: { $0.id == tile.id})! // force-unrwrap because we want a crash if this fails
      
      let selectedTile = tiles[index]
      
      // make sure the tile is empty
      guard selectedTile.player == .empty else { return }
      
      makeMove(index)
      
   }
   
   
   // MARK: Game play
   func makeMove(_ index: Int) {
      
      // make move
      let selectedTile = tiles[index]
      selectedTile.player = turn
      turn = turn == .x ? .o : .x
      moveCount += 1
      
      if let winningMatrix = getWinningMatrix() {
         flashWin(winningMatrix)
      } else if maxMovesReached() {
         print("Tie!")
      }
      
      
   }
   
   func maxMovesReached() -> Bool {
      moveCount >= size*size
   }
   
   // MARK: Check wins
   
   private var lastWin: [[Player]]? // TODO: Do I need to have this property?
   
   func getWinningMatrix() -> [[Player]]? {
      lastWin = nil
      if let checkOWin = checkWin(.o) {
         lastWin = checkOWin
         return lastWin
      } else if let checkXWin = checkWin(.x) {
         lastWin = checkXWin
         return lastWin
      }
      return lastWin
   }
   
   func checkWin(_ p: Player) -> [[Player]]? {
      
      lastWin = nil
      if let win = checkVerticalWin(p) {
         lastWin = win
//      } else if let win = checkHorizontalWin(p) {
//         lastWin = win
//      } else if let win = checkDiagonalWin(p) {
//         lastWin = win
//      } else if let win = checkFourCornersWin(p) {
//         lastWin = win
//      } else if let win = checkBlobWin(p) {
//         lastWin = win
      }
      
      return lastWin
      
   }
   
   func checkVerticalWin(_ p: Player) -> [[Player]]? {
      
      var board = [[Player]](repeating: [Player](repeating: .empty, count: size), count: size)
      var w = [[Player]](repeating: [Player](repeating: .empty, count: size), count: size)
      
      _ = tiles.enumerated().map { (index, tile) in
         let row = index / size
         let col = index % size
         board[row][col] = tile.player
      }

      var foundWinInColumn = false
      
      // traverse horizontally until we find a player
      for col in 0..<size {
         if board[0][col] == p { // found possible win, traverse downward to verify
            foundWinInColumn = true
            
            for row in 0..<size {
               if board[row][col] == p {
                  // populate the winning matrix with the player's marker
                  w[row][col] = p
               } else {
                  // found opposing player, continue to loop through the columns
                  foundWinInColumn = false
                  // clear matrix
                  w = [[Player]](repeating: [Player](repeating: .empty, count: size), count: size)
                  break
               }
            }
            
            // entire column belonged to player, return true
            if foundWinInColumn {
               return w
            }
         }
      }
      
      return nil
   }
   
   private func flashWin(_ w: [[Player]]) {
      print ("Win") // TODO: See ``MainActivity:flashWin()`
   }
   
   
   
   
   
   /**
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
    
    int col = position % GameManager.dimen;
    int row = position / GameManager.dimen;
    
    boolean moveMade = GameManager.makeMove(row, col);
    
    if (moveMade) {
    
    // update board
    drawBoard();
    
    // the board with just the winning markers
    Player[][] w = GameManager.getWinningMatrix();
    
    if (w != null) // we found a winner, display the win to the players
    flashWin(w);
    else if (GameManager.maxMovesReached()) // there was a tie, display it to the players
    Toast.makeText(MainActivity.this, "Tie!", Toast.LENGTH_LONG).show();
    
    }
    
    }
    */
   
}

