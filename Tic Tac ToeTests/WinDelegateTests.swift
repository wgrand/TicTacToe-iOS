//
//  WinTests.swift
//  Tic Tac ToeTests
//
//  Created by William Grand on 4/28/23.
//

import XCTest
@testable import Tic_Tac_Toe


final class WinDelegateTests: XCTestCase {
   var delegate: WinDelegate!
   
   override func setUp() {
      super.setUp()
      delegate = WinDelegate()
   }
   
   func testVerticalWin1() {
      // Arrange
      let player = Player.x
      let board: [[Player]] = [
         [.empty, .empty, .empty, .x],
         [.empty, .empty, .empty, .x],
         [.empty, .empty, .empty, .x],
         [.empty, .empty, .empty, .x]
      ]
      // Act
      let result = delegate.vertical(player, on: board)
      // Assert
      XCTAssertEqual(result, [[.empty, .empty, .empty, .x],
                              [.empty, .empty, .empty, .x],
                              [.empty, .empty, .empty, .x],
                              [.empty, .empty, .empty, .x]])
   }
   
   func testVerticalWin2() {
      // Arrange
      let player = Player.x
      let board: [[Player]] = [
         [.empty, .empty, .o, .x],
         [.empty, .empty, .o, .x],
         [.empty, .empty, .o, .x],
         [.empty, .empty, .o, .x]
      ]
      // Act
      let result = delegate.vertical(player, on: board)
      // Assert
      XCTAssertEqual(result, [[.empty, .empty, .empty, .x],
                              [.empty, .empty, .empty, .x],
                              [.empty, .empty, .empty, .x],
                              [.empty, .empty, .empty, .x]])
   }
   
   func testHorizontalWin1() {
      // Arrange
      let player = Player.o
      let board: [[Player]] = [
         [.o, .o, .o, .o],
         [.empty, .empty, .empty, .empty],
         [.empty, .empty, .empty, .empty],
         [.empty, .empty, .empty, .empty]
      ]
      // Act
      let result = delegate.horizontal(player, on: board)
      // Assert
      XCTAssertEqual(result, [[.o, .o, .o, .o],
                              [.empty, .empty, .empty, .empty],
                              [.empty, .empty, .empty, .empty],
                              [.empty, .empty, .empty, .empty]])
   }
   
   func testHorizontalWin2() {
      // Arrange
      let player = Player.o
      let board: [[Player]] = [
         [.x, .x, .x, .x],
         [.empty, .empty, .empty, .empty],
         [.o, .o, .o, .o],
         [.empty, .empty, .empty, .empty]
      ]
      // Act
      let result = delegate.horizontal(player, on: board)
      // Assert
      XCTAssertEqual(result, [[.empty, .empty, .empty, .empty],
                              [.empty, .empty, .empty, .empty],
                              [.o, .o, .o, .o],
                              [.empty, .empty, .empty, .empty]])
   }
   
   func testDiagonalWin1() {
      // Arrange
      let player = Player.x
      let board: [[Player]] = [
         [.empty, .empty, .empty, .x],
         [.empty, .empty, .x, .empty],
         [.empty, .x, .empty, .empty],
         [.x, .empty, .empty, .empty]
      ]
      // Act
      let result = delegate.diagonal(player, on: board)
      // Assert
      XCTAssertEqual(result, [ [.empty, .empty, .empty, .x],
                               [.empty, .empty, .x, .empty],
                               [.empty, .x, .empty, .empty],
                               [.x, .empty, .empty, .empty]])
   }
   
   func testDiagonalWin2() {
      // Arrange
      let player = Player.x
      let board: [[Player]] = [
         [.x, .empty, .empty, .empty],
         [.empty, .x, .empty, .empty],
         [.empty, .empty, .x, .empty],
         [.empty, .empty, .empty, .x]
      ]
      // Act
      let result = delegate.diagonal(player, on: board)
      // Assert
      XCTAssertEqual(result, [ [.x, .empty, .empty, .empty],
                               [.empty, .x, .empty, .empty],
                               [.empty, .empty, .x, .empty],
                               [.empty, .empty, .empty, .x]])
   }
   
   func testFourCornersWin() {
      // Arrange
      let player = Player.o
      let board: [[Player]] = [
         [.o, .empty, .empty, .o],
         [.empty, .empty, .empty, .empty],
         [.empty, .empty, .empty, .empty],
         [.o, .empty, .empty, .o],
      ]
      // Act
      let result = delegate.fourCorners(player, on: board)
      // Assert
      XCTAssertEqual(result, [[.o, .empty, .empty, .o],
                              [.empty, .empty, .empty, .empty],
                              [.empty, .empty, .empty, .empty],
                              [.o, .empty, .empty, .o]])
   }
   
   func testTwoByTwoWin() {
      // Arrange
      let player = Player.x
      let board: [[Player]] = [
         [.x, .x, .o, .o],
         [.x, .x, .o, .o],
         [.o, .o, .o, .o],
         [.o, .o, .o, .o]
      ]
      // Act
      let result = delegate.twoByTwo(player, on: board)
      // Assert
      XCTAssertEqual(result, [[.x, .x, .empty, .empty],
                              [.x, .x, .empty, .empty],
                              [.empty, .empty, .empty, .empty],
                              [.empty, .empty, .empty, .empty]])
   }
}
