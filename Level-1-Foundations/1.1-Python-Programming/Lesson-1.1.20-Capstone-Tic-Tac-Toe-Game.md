# Lesson 1.1.20: Capstone Project - Tic-Tac-Toe Game

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: All Lesson 1.1.11-1.1.19 | **Topic**: Loops - Comprehensive Integration

---

## Learning Objectives

By the end of this project, you will be able to:
- Integrate all loop concepts into a complete application
- Build an interactive game with user input loop
- Use nested loops for game logic
- Apply conditional statements with loops
- Debug and optimize a complex program
- Handle edge cases and user validation

---

## Project Overview

Build a complete **Tic-Tac-Toe game** where:
- Player (X) plays against computer (O)
- Board is displayed after each move
- Game validates moves and checks for win/draw
- Loops handle game flow, input, AI logic

### Core Concepts Used

✓ `while` loops - Game continuation  
✓ `for` loops - Board iteration, AI search  
✓ Nested loops - Board navigation  
✓ `break` and `continue` - Early exits  
✓ `if/elif/else` - Conditional logic  
✓ Comparisons & logic operators - Win detection

---

## Part 1: Game Board Structure (60 min)

### 1.1 Initialize the Board

```python
# Tic-Tac-Toe board: 3x3 grid
# Positions numbered 0-8 (for easy reference)
# 0 | 1 | 2
# ---------
# 3 | 4 | 5
# ---------
# 6 | 7 | 8

def create_board():
    """Create empty 3x3 board"""
    return [" "] * 9

def print_board(board):
    """
    Display board in user-friendly format
    
    Example output:
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9
    """
    print()
    for row in range(3):
        # Display row values
        for col in range(3):
            index = row * 3 + col
            print(board[index], end=" ")
            
            # Add separators
            if col < 2:
                print("|", end=" ")
        
        print()  # New line after row
        
        # Add horizontal line (except after last row)
        if row < 2:
            print("-----------")
    print()

# Test
board = create_board()
print_board(board)

# Populate with example
board[0] = "X"
board[4] = "O"
board[8] = "X"
print_board(board)
```

### 1.2 Validating Moves

```python
def is_valid_move(board, position):
    """Check if position is valid and empty"""
    
    # Position must be 0-8
    if position < 0 or position > 8:
        return False
    
    # Position must be empty
    if board[position] != " ":
        return False
    
    return True

def get_player_move(board):
    """Get valid move from player (X)"""
    
    while True:
        try:
            # Get input (1-9 for user-friendliness)
            user_input = input("Enter position (1-9): ")
            position = int(user_input) - 1  # Convert to 0-8
            
            # Validate
            if is_valid_move(board, position):
                return position
            else:
                print("Position already taken or invalid")
        
        except ValueError:
            print("Enter a valid number (1-9)")

# Test
# board = create_board()
# move = get_player_move(board)
# board[move] = "X"
```

---

## Part 2: Game Logic (90 min)

### 2.1 Win Detection

```python
def check_winner(board, player):
    """Check if player has won"""
    
    # Win conditions: rows, columns, diagonals
    win_conditions = [
        [0, 1, 2],  # Top row
        [3, 4, 5],  # Middle row
        [6, 7, 8],  # Bottom row
        [0, 3, 6],  # Left column
        [1, 4, 7],  # Middle column
        [2, 5, 8],  # Right column
        [0, 4, 8],  # Diagonal \
        [2, 4, 6],  # Diagonal /
    ]
    
    # Check if player has three in any line
    for line in win_conditions:
        pos1, pos2, pos3 = line
        
        if (board[pos1] == player and 
            board[pos2] == player and 
            board[pos3] == player):
            return True
    
    return False

def is_board_full(board):
    """Check if no more moves possible"""
    for cell in board:
        if cell == " ":
            return False
    return True

# Test
# board = ["X", "X", "X",  # X wins (top row)
#          "O", "O", " ",
#          " ", " ", " "]
# 
# print(f"X wins: {check_winner(board, 'X')}")  # True
```

### 2.2 Computer AI (Simple Strategy)

```python
def get_computer_move(board):
    """Simple AI for computer (O)"""
    
    # Strategy 1: Try to win
    # Check if computer can win in one move
    for position in range(9):
        if is_valid_move(board, position):
            board[position] = "O"  # Temporarily place
            
            if check_winner(board, "O"):
                board[position] = " "  # Undo
                return position
            
            board[position] = " "  # Undo
    
    # Strategy 2: Block player from winning
    # Check if player can win
    for position in range(9):
        if is_valid_move(board, position):
            board[position] = "X"  # Temporarily place
            
            if check_winner(board, "X"):
                board[position] = " "  # Undo
                return position
            
            board[position] = " "  # Undo
    
    # Strategy 3: Take center
    if is_valid_move(board, 4):
        return 4
    
    # Strategy 4: Take corner
    corners = [0, 2, 6, 8]
    for position in corners:
        if is_valid_move(board, position):
            return position
    
    # Strategy 5: Take any available
    for position in range(9):
        if is_valid_move(board, position):
            return position
    
    # No valid move (shouldn't happen if game logic is correct)
    return -1

# Test
# board = create_board()
# board[0] = "X"
# move = get_computer_move(board)
# print(f"Computer moves to position {move + 1}")
```

---

## Part 3: Game Flow (90 min)

### 3.1 Main Game Loop

```python
def play_game():
    """Main game loop"""
    
    print("="*40)
    print("TIC-TAC-TOE GAME")
    print("="*40)
    print("Positions 1-9:")
    print(" 1 | 2 | 3")
    print("-----------")
    print(" 4 | 5 | 6")
    print("-----------")
    print(" 7 | 8 | 9")
    
    board = create_board()
    game_over = False
    winner = None
    move_count = 0
    
    # Game loop
    while not game_over:
        print_board(board)
        
        # Player move
        print("Your turn (X)")
        player_position = get_player_move(board)
        board[player_position] = "X"
        move_count += 1
        
        # Check if player won
        if check_winner(board, "X"):
            game_over = True
            winner = "Player"
            break
        
        # Check if board full
        if is_board_full(board):
            game_over = True
            winner = "None"  # Draw
            break
        
        # Computer move
        print_board(board)
        print("Computer's turn (O)")
        computer_position = get_computer_move(board)
        
        if computer_position == -1:
            game_over = True
            winner = "None"  # Unexpected: no valid move
            break
        
        board[computer_position] = "O"
        move_count += 1
        
        # Check if computer won
        if check_winner(board, "O"):
            game_over = True
            winner = "Computer"
            break
        
        # Check if board full
        if is_board_full(board):
            game_over = True
            winner = "None"  # Draw
            break
    
    # Game over - display result
    print_board(board)
    
    if winner == "Player":
        print("✓ You won!")
    elif winner == "Computer":
        print("✗ Computer won!")
    else:
        print("= Draw game!")
    
    return winner

# To play: play_game()
```

### 3.2 Game Continuation

```python
def play_tournament():
    """Play multiple games, track record"""
    
    player_wins = 0
    computer_wins = 0
    draws = 0
    
    while True:
        print("\n" + "="*40)
        
        winner = play_game()
        
        if winner == "Player":
            player_wins += 1
        elif winner == "Computer":
            computer_wins += 1
        else:
            draws += 1
        
        # Show record
        print("\n" + "="*40)
        print(f"Record: You {player_wins} - Computer {computer_wins} (Draws: {draws})")
        
        # Ask to play again
        while True:
            again = input("\nPlay again? (yes/no): ").lower()
            if again in ["yes", "no", "y", "n"]:
                break
            print("Enter 'yes' or 'no'")
        
        if again in ["no", "n"]:
            print("\nFinal Record:")
            print(f"  You: {player_wins} wins")
            print(f"  Computer: {computer_wins} wins")
            print(f"  Draws: {draws}")
            print("\nThanks for playing!")
            break
```

---

## Part 4: Complete Implementation

Here's the full working game:

```python
#!/usr/bin/env python3
"""
Tic-Tac-Toe Game
Human (X) vs Computer (O)
"""

def create_board():
    """Create empty 3x3 board"""
    return [" "] * 9

def print_board(board):
    """Display board"""
    print()
    for row in range(3):
        for col in range(3):
            index = row * 3 + col
            print(board[index], end=" ")
            if col < 2:
                print("|", end=" ")
        print()
        if row < 2:
            print("-----------")
    print()

def is_valid_move(board, position):
    """Check if move is valid"""
    if position < 0 or position > 8:
        return False
    if board[position] != " ":
        return False
    return True

def get_player_move(board):
    """Get player's move with validation"""
    while True:
        try:
            user_input = input("Enter position (1-9): ")
            position = int(user_input) - 1
            
            if is_valid_move(board, position):
                return position
            else:
                print("Position taken or invalid")
        except ValueError:
            print("Enter a number 1-9")

def check_winner(board, player):
    """Check if player won"""
    win_conditions = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
        [0, 4, 8], [2, 4, 6]              # Diagonals
    ]
    
    for line in win_conditions:
        if all(board[pos] == player for pos in line):
            return True
    return False

def is_board_full(board):
    """Check if board is full"""
    return all(cell != " " for cell in board)

def get_computer_move(board):
    """AI for computer move"""
    
    # Try to win
    for position in range(9):
        if is_valid_move(board, position):
            board[position] = "O"
            if check_winner(board, "O"):
                board[position] = " "
                return position
            board[position] = " "
    
    # Block player
    for position in range(9):
        if is_valid_move(board, position):
            board[position] = "X"
            if check_winner(board, "X"):
                board[position] = " "
                return position
            board[position] = " "
    
    # Take center
    if is_valid_move(board, 4):
        return 4
    
    # Take corner
    for position in [0, 2, 6, 8]:
        if is_valid_move(board, position):
            return position
    
    # Take any
    for position in range(9):
        if is_valid_move(board, position):
            return position
    
    return -1

def play_game():
    """Single game loop"""
    print("="*40)
    print("TIC-TAC-TOE")
    print("="*40)
    
    board = create_board()
    game_over = False
    winner = None
    
    while not game_over:
        print_board(board)
        
        # Player move
        print("Your turn (X)")
        player_position = get_player_move(board)
        board[player_position] = "X"
        
        if check_winner(board, "X"):
            game_over = True
            winner = "Player"
            break
        
        if is_board_full(board):
            game_over = True
            winner = "None"
            break
        
        # Computer move
        print_board(board)
        print("Computer's turn (O)...")
        computer_position = get_computer_move(board)
        
        if computer_position == -1:
            game_over = True
            winner = "None"
            break
        
        board[computer_position] = "O"
        
        if check_winner(board, "O"):
            game_over = True
            winner = "Computer"
            break
        
        if is_board_full(board):
            game_over = True
            winner = "None"
            break
    
    print_board(board)
    
    if winner == "Player":
        print("✓ You won!")
    elif winner == "Computer":
        print("✗ Computer won!")
    else:
        print("= Draw!")
    
    return winner

def main():
    """Main tournament loop"""
    player_wins = 0
    computer_wins = 0
    draws = 0
    
    print("Welcome to Tic-Tac-Toe!\n")
    
    while True:
        winner = play_game()
        
        if winner == "Player":
            player_wins += 1
        elif winner == "Computer":
            computer_wins += 1
        else:
            draws += 1
        
        print(f"\nRecord: You {player_wins} - Computer {computer_wins} (Draws: {draws})")
        
        while True:
            again = input("Play again? (yes/no): ").lower()
            if again in ["yes", "no", "y", "n"]:
                break
        
        if again in ["no", "n"]:
            print(f"\nFinal: You {player_wins} - Computer {computer_wins}")
            break

if __name__ == "__main__":
    main()
```

---

## Enhancements & Challenge Ideas

### Basic Enhancements

```python
# 1. Better formatting
def print_fancy_board(board):
    """Print with colors or special chars"""
    pass

# 2. Difficulty levels
def get_computer_move_hard(board):
    """More sophisticated AI"""
    pass

# 3. Game history
def save_game_history():
    """Record moves for replay"""
    pass

# 4. Statistics
def print_statistics():
    """Win rate, average game length, etc."""
    pass
```

### Advanced Enhancements

- Variable board size (4x4, 5x5)
- Two-player mode
- Undo move feature
- Computer difficulty settings
- Game replay
- Network play

---

## Testing Checklist

Before considering project complete:

- [ ] All moves validated correctly
- [ ] Win detection works for all scenarios
- [ ] Board full detection works
- [ ] Computer never takes invalid move
- [ ] Game loops continue correctly
- [ ] Can play multiple games
- [ ] Handle all edge cases
- [ ] User input validated properly

---

## Key Concepts Reviewed

This project uses:

| Concept | Usage |
|---------|-------|
| **while loops** | Main game loop, input validation |
| **for loops** | Board iteration, AI search, win checking |
| **Nested loops** | Board display, win condition checking |
| **break** | Exit loop when game ends |
| **continue** | Skip invalid positions |
| **if/elif/else** | Game logic, move validation |
| **Comparisons** | Position checking, win detection |
| **Logical operators** | Complex conditions |

---

## Homework & Submission

Required:

- [ ] Complete working Tic-Tac-Toe game
- [ ] All functions documented with docstrings
- [ ] Handles edge cases gracefully
- [ ] User can play multiple games
- [ ] Code is clean and readable

Optional Enhancements:

- [ ] Implement one enhancement from suggestions
- [ ] Add gameplay statistics
- [ ] Improve computer AI
- [ ] Better visual formatting

**Expected time**: 4-6 hours

---

## Project Reflection

After completing, reflect on:

1. **What loops did you use most?** (while, for, nested)
2. **What was the hardest part?** (logic, loops, integration)
3. **How would you improve the AI?**
4. **What would you change in the code?**
5. **What did you learn about loops?**

---

**Project Complete!** 🎉

Proceed to **Lesson 1.1.21** (Milestone Test 2) to assess mastery of this topic.




