# 2024-group-11
Overview of Software Engineering - University of Bristol MSc Group Project

Qiyuan Chen, ty23828@bristol.ac.uk, ty23828

Ahmed El Ashry, pu20789@bristol.ac.uk, ahmedcoolestman

Jialun He, cb23036@bristol.ac.uk, kkggbo

Ching-Chun Juan, iq23062@bristol.ac.uk, alicejuancc



# Group Photo
![image](https://github.com/UoB-COMSM0110/2024-group-11/assets/69910719/2221f7df-e9b5-4e8e-b8aa-bd7b3e7a9eb7)



# Game ideas:
## Game Idea 1: Flappy Bird Name: Chameleon Chase 
In this version of Flappy Bird, the pipes and the bird are dynamically changing colors. 
The twist is that the player must control the bird to match its color with the upcoming pipes to pass through them.
The second twist is that the pipes move dynamically to trap the bird.
The third twist is that there are two players and the two players each control a racing bird (whose speed can be adjusted by the arrow keys)

## Game Idea 2: BrickBreaker

In "Pixel Bouncer," the classic brick breaker game takes a twist with a pixelated, retro aesthetic. 
Players control a bouncing pixel ball with the goal of breaking colorful pixel bricks in a dynamic and evolving environment. 
The twist comes with the introduction of various power-ups, challenging obstacles, and a unique bouncing mechanic.
The speed and direction of the balls can be adjusted by the area of the paddle stricken with. Hitting  CERTAIN moving animal ends the game. 
There are multiple mitating levels of increasing difficulty and hitting a certain ball can reverse direction, change ball size, and reverse
gravity. 

## Game Idea 3: NS-Shaft

In the game, a player can control the left and right direction keys to move to the left or right. 
As the platform continues to rise, the goal is to allow the player to go down the maximum number of floors.
The player has a total of 12 points of health. If contacting the spikes on the ceiling or the spike platform, 
he will receive negative points of damage. 
When the player is injured by the spikes on the ceiling, he will be forced to leave the platform and jump down. 
The game ends when the health point reaches zero or when the player falls to the bottom.

  Twist:
  Items appear randomly to allow the player to restore health points or change the platform on the field.

  Challenges: 
  1. Implementing dynamic behaviors for various platforms (ordinary, fake, spring, crawler, spiked) and ensuring precise collision detection.
  2. Managing the health system and accurately calculating damage from spiked platforms.
  3. Balancing difficulty across platform types, adjusting spiked platform frequency, and the speed of the rising platform.



# Paper Protopyes
## 1.NS-Shaft
*TODO*
## 2.flappy bird
*TODO*


# Requirements
## Stakeholders and user stories
1. Game Developers and Designers
- I want a robust game engine that supports both 2D and 3D graphics, allowing for flexible and visually stunnning gameplay
- I want an efficient debugging tool that provides real-time insights into the game's performance, helping me identify and fix issues quickly
- I want an easy-to-use scripting language that allows rapid prototyping and iteration of game mechanics, enhancing the development workflow
- I want a comprehensive multilayer framework that supports various modes (co-op, competitive) and provides tools for seamless online intergration
- I want docimentation that is clear, concise, and regularly updated, enabling me to understand and implement new features without unnecessary delays

Game Designers User Story
- I want an intuitative level editor that allows me to create diverse and engaging game environments with ease, allowing me to relaise my creative visions
- I want access to a vast libray of assets - incl. characters, objects and environments, to enhance the visual appeal of the game without compromising the
performance
- I want a flexible AI system that allows me to create challenging and dynamic enemy behaviours, contributing to an immersive and enjoyable player experience
- I want analytics tools that provide valuable player data, allowing me to make informed decisions about game balance, difficulty and feature improvement
- I want collaboration features that enable seamless communication with the development team, ensuring a smooth integration of design elements into the final
project
2. Game Publisher User Story
- I want a detailed, customizable analytics dashboard that provides info on player engagement, retention, and monetization, supporting data-driven decision
making
- I want a reliable and secure solution to protect IP while minimizing impact on player experience
- I want marketing tools integrated into the game platform, allowing for targeted promotions, advertisments, and community engagement to boost game visibility
and sales
- I want seamless integration with popular gaming platforms and storefronts, simplifying the distibution process and maximising game's reach
- I want a transparent and collaborative relationship with the development team, including regular progress updates and open communication channels 

3. Players (End Users)
- As a player of the game, I want the game to have the feature of saving the current progress so that I could restore the status after shutting down the game.

4. Investors and Financiers
- As a investor and financier, I want to experience constant updates and new content to ensure that the game remains fresh, attracts new players, and retains old players.

5. Platform Providers
  Through platform providers, users can easily play this game on the platform, while the game possesses payment systems, achievements, and community interaction functionalities, 
allowing users to have a seamless gaming experience and added value services. At the same time, the platform's security and privacy policies can protect user information safety 
and interests.

6. Marketing and PR teams
  Through the efforts of marketing and PR team members, users are more easily attracted by the visual and narrative elements of the game, and extensive publicity and promotion 
provide users with more ways to learn about the game. Additionally, if users provide sufficient feedback, members of the marketing and PR teams can measure the effectiveness 
of marketing campaigns, optimize future marketing strategies, and better communicate with the media and players.

7. Quality Assurance Testers

8. Community Managers

9. Legal Advisors

10. Educational Institutions 

## Worked Through Use Case Specification
Player/Gamer

User Story: I want to customize my bird's appearance in chameleon chase

Customizing the Bird's Appearance

Actor: Player

Precondition: Player launched Chameleon Chase

Main Flow:

  1. Player selects customization menu
  2. Accesses Bird Appearance Options
  3. Chooses Colour Scheme
  4. Applys Patterns and Accessories
  5. Previews Customized Bird
  6. Saves the Customization

Postcondition: Player's bird is updated according to their customization

Alternative: If customized version not saved, default is selected

Exceptions: Technical issues/limitations stop customization from being saved

Success Scenario: Personalised gameplay with customized bird

Future: Customization options expand with new updates, achievements (Such as bronze, silver, gold for high scores) can be attached to user's bird 

## Use Case Diagram
*TODO*

## Reflection
*TODO*


