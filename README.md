# TicTacToe-iOS

# Tic Tac Toe for iOS

A classic Tic Tac Toe game for iOS with a 4x4 board, dark mode, unit tests, localization, and support for iOS 15. The game follows the standard Tic Tac Toe rules with some additional win indicators.

## Features

- 4x4 tic tac toe board on the screen
- Start button to clear the current board and restart the game
- Alternating X and O turns where you touch the square to fill it in
- Win indicators for the following:
    - 4 in a row (vertical/horizontal/diagonal)
    - 4 corners
    - 2x2 box
- Dynamic algorithm to determine a win regardless of the board size
- Dark mode support
- Localization support for multiple languages
- MVVM architecture
- CI/CD integration with Bitrise

## Installation

1. Clone the repository to your local machine.
2. Open the project file in Xcode.
3. Select the simulator or device you want to run the app on.
4. Build and run the app.

## Usage

1. Open the app.
2. The game board will be displayed on the screen.
3. Tap on a square to fill it with your marker.
4. Continue taking turns with the other player until a win is achieved or the board is full.
5. If a win is achieved, a win indicator will appear on the board.
6. Press the "NEW GAME" button to clear the board and start a new game.

## Localization

The app supports the following languages:

- English

In the future, to change the language of the app, go to Settings > General > Language & Region on your device and select the desired language.

## Architecture

The app is built using the MVVM architecture. The model represents the state of the game board, the view displays the game board and win indicators, and the view model handles game logic and communication between the model and view.

## Testing

The app includes unit tests to ensure correct functionality. Tests cover game logic, win detection, and model manipulation.

## Requirements

- iOS 15 or later
- Xcode 14.3 or later

## CI/CD

The app is integrated with Bitrise for continuous integration and deployment. On every commit to the main branch, the app is automatically built, tested, and deployed to a development environment for further testing. Once approved, the app is deployed to the App Store using Bitrise's automated deployment process.