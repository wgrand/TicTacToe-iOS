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
          .strokeBorder(Color(colorScheme == .dark ? .white : .gray), lineWidth: 10)
          .frame(width: 50, height: 50)
    }
  }
}

struct OView_Previews: PreviewProvider {
  static var previews: some View {
    OView()
  }
}
