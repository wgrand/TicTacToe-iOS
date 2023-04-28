//
//  OView.swift
//  Tic Tac Toe
//
//  Created by William Grand on 4/26/23.
//

import SwiftUI

struct XView: View {
   
   @Environment(\.colorScheme) var colorScheme
   
   var body: some View {
      
      ZStack {
         
         Rectangle()
            .fill(colorScheme == .dark ? .white : .gray)
            .frame(width: 50, height: 10)
            .rotationEffect(.degrees(45))
            .aspectRatio(1, contentMode: .fit)
         
         Rectangle()
            .fill(colorScheme == .dark ? .white : .gray)
            .frame(width: 50, height: 10)
            .rotationEffect(.degrees(-45))
            .aspectRatio(1, contentMode: .fit)
         
      }
      .frame(width: 45, height: 45)
      
   }
}

struct XView_Previews: PreviewProvider {
   static var previews: some View {
      XView()
   }
}
