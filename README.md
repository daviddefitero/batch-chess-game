# Command Line Chess Game 🎮

Welcome to my Command Line Chess implementation in Batch! This project demonstrates a functional chess game that runs directly in the Windows command prompt.

## 📝 Description

This repository contains a chess game implementation using Batch scripting. The game features a command-line interface with piece movement validation, turn system, and basic chess rules.

---

## ⚠️ Known Issues

### Piece Disappearance Bug
Currently, pieces are inadvertently removed when displaying possible moves on the board.

#### Technical Details
- Issue occurs during move preview
- Affects pieces located in potential movement squares
- Related to board refresh mechanism

#### Planned Solution
Future implementation will include:
- Secondary array to store piece positions
- Position restoration after clearing movement indicators
- Enhanced board state management

---

## 📂 Repository Structure

```plaintext
📦 chess-game
├── 📁 components
│   ├── Menu.bat
│   └── Game.bat
├── 📁 utils
│   ├── Init.bat
│   ├── ShowBoard.bat
│   ├── ClearSelection.bat
│   └── LetterToNumber.bat
└── README.md
```

The repository is organized into components and utilities, with each file handling specific game functionalities.

---

## 🌟 Features

- Interactive chess board display in command prompt
- Turn-based gameplay (White/Black)
- Piece movement validation
- Support for all standard chess pieces:
    - Pawns
    - Rooks
    - Knights
    - Bishops
    - Queens
    - Kings

---

## 🔧 Technical Requirements

To run this chess game, you'll need:

- Windows Operating System
- Command Prompt (CMD)
- Basic understanding of chess rules

---

## 💻 How to Play

1. Run `CHESS.BAT` to start the game
2. Select pieces using chess notation (e.g., "E2")
3. Move pieces by selecting destination square
4. Use "D" to deselect a piece
5. Follow standard chess rules for piece movement

---

## 🎯 Implementation Details

- Written entirely in Batch scripting
- Modular code structure
- Clear visual feedback for:
    - Selected pieces
    - Possible moves
    - Current turn
    - Board state

---

## 🚧 Future Improvements

- Check and checkmate detection
- Save/Load game functionality
- Move history
- AI opponent implementation

---

## 📬 Contact

Have any questions or suggestions? I'd love to hear from you!  

- 📧 **david@defitero.com** 