//
//  OView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct OView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Circle()
        .fill(colorScheme == .dark ? .white : .gray)
        .frame(width: 50, height: 50)
      Circle()
        .fill(colorScheme == .dark ? .gray : .white)
        .frame(width: 30, height: 30)
    }
  }
}

struct OView_Previews: PreviewProvider {
  static var previews: some View {
    OView()
  }
}
