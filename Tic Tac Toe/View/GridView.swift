//
//  GridView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct GridView: View {

  @ObservedObject var gameManager = GameManager()

  var body: some View {
    LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 0), count: 4), spacing: 0) {
      ForEach(gameManager.tiles.indices) { index in
        Tile(tileType: $gameManager.tiles[index].wrappedValue)
          .onTapGesture {
            gameManager.tileTapped(index: index)
          }
      }
    }.padding(16)
    .aspectRatio(1, contentMode: .fit)

  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    GridView()
  }
}
