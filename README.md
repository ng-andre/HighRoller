# Orbital

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

Telegram Bot provides a chat-like interface and can be added into an existing chat group to provide the functionalities of the app in a more easily accessible form
Able to start the bot in a common group where all players are presents
Allow players to start new session and join crossplatform
Set starting sum for all players and game rules
Alternative game modes (Mahjong, Blackjack, Poker, common pot)
Update database after every transaction by using command like (/pay @username amount) --------
Allow collection of payment from another player only with their approval.
(/show) to display the winning of individual 
(/showall) to display the current winning/ losses in a group
Display final tally at the end of a session (Algorithm used as way to simplify final transaction)
Display Match History of the past 10 games with wins and losses 










To Do:
Basic Functionality 
  Tracking of funds
  Sync among players
  
Single Session Instance on Server



Roles and Responsibilities


https://stackoverflow.com/questions/974922/algorithm-to-share-settle-expenses-among-a-group
