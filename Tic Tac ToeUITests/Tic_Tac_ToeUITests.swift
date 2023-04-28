//
//  Tic_Tac_ToeUITests.swift
//  Tic Tac ToeUITests
//
//  Created by William Grand on 4/26/23.
//

import XCTest

final class Tic_Tac_ToeUITests: XCTestCase {
   
   var app: XCUIApplication!
   
   override func setUpWithError() throws {
      continueAfterFailure = false
      app = XCUIApplication()
      app.launch()
   }
   
   override func tearDownWithError() throws {
      app = nil
      super.tearDown()
   }

   func testVerticalWin() throws {
      
      let element = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      element.children(matching: .button).element(boundBy: 0).tap()
      element.children(matching: .button).element(boundBy: 1).tap()
      element.children(matching: .button).element(boundBy: 4).tap()
      element.children(matching: .button).element(boundBy: 5).tap()
      element.children(matching: .button).element(boundBy: 8).tap()
      element.children(matching: .button).element(boundBy: 6).tap()
      element.children(matching: .button).element(boundBy: 12).tap()

      try assertWinnerAlert()

   }

   func testHorizontalWin() throws {
      
      let element = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      element.children(matching: .button).element(boundBy: 0).tap()
      element.children(matching: .button).element(boundBy: 4).tap()
      element.children(matching: .button).element(boundBy: 1).tap()
      element.children(matching: .button).element(boundBy: 5).tap()
      element.children(matching: .button).element(boundBy: 2).tap()
      element.children(matching: .button).element(boundBy: 6).tap()
      element.children(matching: .button).element(boundBy: 3).tap()
      
      try assertWinnerAlert()

   }
   
   func testDiagonalWin() throws {
      
      let element = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      element.children(matching: .button).element(boundBy: 0).tap()
      element.children(matching: .button).element(boundBy: 1).tap()
      element.children(matching: .button).element(boundBy: 5).tap()
      element.children(matching: .button).element(boundBy: 8).tap()
      element.children(matching: .button).element(boundBy: 10).tap()
      element.children(matching: .button).element(boundBy: 6).tap()
      element.children(matching: .button).element(boundBy: 15).tap()
            
      try assertWinnerAlert()

   }
   
   func testFourCornersWin() throws {
      
      let element = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      element.children(matching: .button).element(boundBy: 0).tap()
      element.children(matching: .button).element(boundBy: 5).tap()
      element.children(matching: .button).element(boundBy: 3).tap()
      element.children(matching: .button).element(boundBy: 1).tap()
      element.children(matching: .button).element(boundBy: 12).tap()
      element.children(matching: .button).element(boundBy: 9).tap()
      element.children(matching: .button).element(boundBy: 15).tap()
            
      try assertWinnerAlert()

   }
   
   func test2x2Win() throws {

      let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      element.children(matching: .button).element(boundBy: 5).tap()
      element.children(matching: .button).element(boundBy: 1).tap()
      element.children(matching: .button).element(boundBy: 6).tap()
      element.children(matching: .button).element(boundBy: 2).tap()
      element.children(matching: .button).element(boundBy: 9).tap()
      element.children(matching: .button).element(boundBy: 4).tap()
      element.children(matching: .button).element(boundBy: 10).tap()
      
      try assertWinnerAlert()
            
   }
   
   func assertWinnerAlert() throws {

      // Wait for the alert message to appear
      let alert = app.alerts.firstMatch
      XCTAssertTrue(alert.waitForExistence(timeout: 1))

      // Dismiss the alert message
      alert.scrollViews.otherElements.buttons["Yes"].tap()

   }
   
   func testTie() throws {
      
      let element = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      
      element.children(matching: .button).element(boundBy: 1).tap()
      element.children(matching: .button).element(boundBy: 0).tap()
      element.children(matching: .button).element(boundBy: 2).tap()
      element.children(matching: .button).element(boundBy: 3).tap()
      element.children(matching: .button).element(boundBy: 7).tap()
      element.children(matching: .button).element(boundBy: 6).tap()
      element.children(matching: .button).element(boundBy: 5).tap()
      element.children(matching: .button).element(boundBy: 4).tap()
      element.children(matching: .button).element(boundBy: 8).tap()
      element.children(matching: .button).element(boundBy: 10).tap()
      element.children(matching: .button).element(boundBy: 11).tap()
      element.children(matching: .button).element(boundBy: 15).tap()
      element.children(matching: .button).element(boundBy: 14).tap()
      element.children(matching: .button).element(boundBy: 13).tap()
      element.children(matching: .button).element(boundBy: 12).tap()
      element.children(matching: .button).element(boundBy: 9).tap()
                  
      // Wait for the alert message to appear
      let alert = app.alerts.firstMatch
      XCTAssertTrue(alert.waitForExistence(timeout: 1))

      // Verify the alert message text
      let expectedMessage = "Tie!"
      XCTAssertEqual(alert.staticTexts[expectedMessage].label, expectedMessage)

      // Dismiss the alert message
      alert.buttons["Yes"].tap()
      
   }
   
   

   func testLaunchPerformance() throws {
      if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
         // This measures how long it takes to launch your application.
         measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
         }
      }
   }
}
