//
//  Tile.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct Tile: View {

  @State var tileType: TileType = .empty

  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color.clear)
        .border(.gray)
        .aspectRatio(1, contentMode: .fit)

      switch(tileType) {
      case .empty:
        Text("")
          .font(.system(size: 50))
          .foregroundColor(.gray)
      case .x:
        Text("X")
          .font(.system(size: 50))
          .foregroundColor(.gray)
      case .o:
        Text("O")
          .font(.system(size: 50))
          .foregroundColor(.gray)
      }
    }
  }
}

struct Tile_Previews: PreviewProvider {
  static var previews: some View {
    Tile()
  }
}
