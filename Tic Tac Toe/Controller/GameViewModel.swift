//
//  GameManager.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import Foundation
import SwiftUI

@MainActor class GameViewModel: ObservableObject {
   
   private(set) var dimen: Int

   @Published var tiles: [Tile]
   @Published private(set) var turn: TileType = .x
   
   init(dimen: Int = 4) {
      self.dimen = dimen
      self.tiles = (0..<(dimen*dimen)).map { Tile(id: $0) }
      self.turn = .x
   }
   
   init() {
      self.dimen = 4
      self.tiles = (0..<(dimen*dimen)).map { Tile(id: $0) }
      self.turn = .x
   }
   
   func tileTapped(tile: Tile) {
      
      guard let selectedTile = tiles.first(where: { $0.id == tile.id}) else { return }
      guard selectedTile.tileType == .empty else { return }
      print("Tile \(selectedTile.id) tapped")
      selectedTile.tileType = turn
      turn = turn == .x ? .o : .x

   }
   
   func create() {
      tiles = (0..<(dimen*dimen)).map { Tile(id: $0) }
      turn = .x
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
