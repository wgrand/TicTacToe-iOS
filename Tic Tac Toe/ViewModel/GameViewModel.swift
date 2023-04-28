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
   private var delegate: WinDelegateProtocol
   
   @Published var tiles: [Tile]
   @Published private(set) var turn: Player = .x
   @Published var lastWin: [[Player]]?
   
   
   

   init(dimen: Int = 4) {
      self.size = dimen
      self.tiles = (0..<(dimen*dimen)).map { Tile(id: $0) }
      self.turn = .x
      self.moveCount = 0
      self.delegate = WinDelegate()
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
   
   func getWinningMatrix() -> [[Player]]? {
      if let winner = delegate.all(tiles: tiles, size: size, player: .o) ?? delegate.all(tiles: tiles, size: size, player: .x) {
         lastWin = winner
      }
      return lastWin
   }
   


   
   private func flashWin(_ w: [[Player]]) {
      
      for row in 0..<w.count {
         for col in 0..<w[row].count {
            if w[row][col] != .empty {
               let index = row*w[row].count + col
               tiles[index].isWin = true
            }
         }
      }
      
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

