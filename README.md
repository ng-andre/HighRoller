# Orbital

GitHub Link:

https://github.com/ng-andre/HighRoller

Demo Link:
Telegram Bot: @demo1998bot 
Note: Still not fully functioning, only basic offline features are present

Tech Stack:
Flutter SDK
Firebase Realtime Database
Telegram API for Telegram Bot
 
Figma Prototype
https://www.figma.com/file/ve5koqcc0X5k27uzBg1uuR/First-Draft?node-id=43%3A3521


Project Timeline:



Milestone 1:
Learning Tech Stack
Initial Design Draft and Prototyping of App
Research 
Basic Telegram Bot with tracking functionality

Milestone 2: 
Minimum Viable Product (MVP)
Users are able to create rooms and join using simple invite codes
Basic application functionality is present 
Able to make payments to other users
Generate a final tally of the game at the end 
Sync between different devices across Firebase Realtime Database

To do for Milestone 3:
Additional Features:
Implement different game modes such as Mahjong and Blackjack (in progress)
Local storage of Match History
Sync games with Telegram API
Allow collection of payment from another player only with their approval (to decide)


Project Log:

Learn about Firebase 3 hrs
Learn Flutter 5 hrs
Meetings 5 hrs
Designing App Logo 3 hrs
Write ReadMe and Documentation 5 hrs
WireFraming on Figma 5 hrs
Making Poster and Video 8 hrs 
Creating TimeLine for the Project 1.5 hrs
Writing User Story 1.5hrs
Learning about writing Telegram Bot 3 hrs
Learning JavaScript Syntax 1.5 hrs
Writing Telegram Bot Script for money Tracking 2hrs
Setting up the Development Environment for Flutter 3 hrs
Meeting with mentor 1.5 hrs
Write Login Page 3hrs
Write InGamePage 3hrs
Write Logic for the InGame Page for transaction 8 hrs
Initializing Join Game and New Game using FireBase 7 hrs
Debugging 8 hrs


Motivation:

When playing card games such as Poker or Blackjack with friends, tracking payment is always a hassle without the use of cash or chips. Players often have to resort to rudimentary means such as using the calculator or notes on their smartphone in order to track wins and losses.  
This problem is further exacerbated by the fact that in the cashless society of today, the vast majority of us have swapped to contactless payment options and do not have much cash in hand. Hence, it is often a hassle to keep track of winnings and losses.

Furthermore, in light of the current global pandemic we are experiencing, avoiding physical contact with the chips that are commonly used when gambling would be preferable to many.

As such, this app aims to serve as a hassle-free solution to the problems above.

User Stories:

Feature: Able to start the bot in a common group where all players are presents
Scenario: A group of friends with an existing group chat wants to gamble together
They can add the bot into their group chat and start a new game so that they can start gambling without chips with minimal setup time.

Feature: Allow players to join a game across different platforms (Telegram Bot, WebApp, iOS/Android app)
Scenario: A group of friends with an existing group chat wants to gamble with others outside their group but do not want to add them into the group or create a new group chat
They can create a game on Telegram and allow players to join on alternate platforms to avoid the interfacing and setup issues.

Feature: Initialise a game with a starting sum and select different game modes
Scenario: Players want to play specific games with a high rate of transaction (i.e. fast paced with many rounds) and track smoothly without the use of physical chips 
Players can set an initial buy-in amount for each player or use a default value, and use preset game modes for easy setup so that they can reduce the setup time before starting their session.

Feature: Able to record down each transaction of each game within the current gambling session.
Scenario: Players will want to record down who wins how much from who from each game so that it can be tallied up at the end of the gambling session.

Feature: Display the current winning/losses of all players in a current gambling session.
Scenario: Players want to know how much they are ahead/behind others in the current gambling game.

Feature: Tally up the winnings of a gambling session.
Scenario: Players that finish the game and want to know how much to pay each other at the end of the gambling session for easy payout at the end of the gambling session.

Feature: Able to show how much you have won/lost over the past few games.
Scenario: Players who want to know how well he has been doing for the past few games can look at the game history to see his winnings and losses.

