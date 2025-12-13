# Next up:
Set up player class
Set up game class to coordinate the game

## Who knows what
The board knows its layout, how to determine the winner
The player know what mark it is, and IO system to receive location on where to mark
### Next time
The main controller knows whose turn it is and coordinate between the player and the board; here lies the game loop;
it also can determine if a location already has a mark by checking with the board, then prompt the player for another
location to mark. It also can ask the 1st player to either be X or O. The board should also note the numpad position at the beginning of each game.

# Plan
Setup: 2 players, a board, Os, Xs, victory condition
Not to share information between classes more than needed
...

# Goal
2 players play against each other and the board is displayed between turns.

How to input where to place the O and X? Numpad 1-9 for now where
789
456
123

  0 1 2
  ______
0|
1|
2|

.|.|.
.|.|.
.|.|.
-|-|-
X|O|X

If I need to change later on, then since my elements are modular, I won't have to change too much codes.

2 players are X and O.

############################## Classes
Player: type X or O, update the board
Board game: location info, determine winning condition

# Test
At a minimum, how do I unit test my code?

# Timeline
- Design: 3-7 days
- Unit test for each class: 7 days
- Coding each class: 7 days
- Manual integration test: 3 days
- Automatic integration test? Probably set up a few test cases: 3 days