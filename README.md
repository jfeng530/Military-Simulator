<p align="center"><img width=50% src="https://i.imgur.com/gjcSw7Z.png"></p>

<p>
  <img align="center" src="https://img.shields.io/badge/SQLite-3.30.1-336791">
  <img align="center" src="https://img.shields.io/badge/Ruby-2.6.1-CC342D">
</p>

# Contents
- [Overview](#overview)
  - [Description](#description)
  - [Features](#features)
  - [Challenges](#challenges)
  - [Technologies & Frameworks](#technologies-and-frameworks)
- [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Instructions](#instructions)
- [License](#license)

&nbsp;

# Overview
  ### Description
  Totally Accurate Military Simulator is a CLI turn-based role-playing strategy game. Take command of your troops and lead them to victory against different characters and enemies from across pop culture. Create and design your own units with different classes and custom move-sets. View your unit’s service record to see how well they fare in battle.  
  
  ### Features
  - Create up to 3 saves files to save and continue your progress
  - Create (Recruit) your own custom character
    - Choose the class and create a move-set for the character 
  - View a character's battle record
  - Battle enemies with an advanced battle system
    - Characters with attributes that incorporates strengths and weaknesses
    - Various move-set including attack, defense and special moves
    - Battle interface with character models, health bar and status effect
  - Loading Screens
  
  ### Challenges
  - Creating a battle system that incorporates diverse strategies and an interactive user experience
    - Created a 'rock-paper-scissor' class system to introduce parity
    	 - Units can be either be 'Air Force', 'Infantry' or 'Air Defense Artillery'
    - Created 'status effects' for characters in battle to add strategy to combat
      - Characters can be afflicted with status effects that persist throughout battle (‘Hurt’, ‘Protected’, ‘Amped-up’) 
    - Created moves with different effects (Damage, Heal, Charge-Up, Protect, Hurt) to add strategy in combat
    	 - Each move has a specific property associate with it
      - Conditional statements check for property and, if applicable, status effect of character before 'activating' move
  - Creating the proper relationship between two instances of a `Character` model
    - Created a self-referential relationship between two instances of a `Character`, joined by the `Battle` class
  - Creating an interactive user interface with audio and visual elements
    - Used [TTY::Prompt](https://github.com/piotrmurach/tty-prompt) to implement a user interface
    - Incorporated ASCII art to create a title screen, loading screens and character sprites
    - Used CLI MP3 player to play background and theme music
    - Used CLI command to have voice over commentary
  
  ### Technologies and Frameworks
  - [Ruby](https://www.ruby-lang.org/en/)
  - [Ruby on Rails](https://rubyonrails.org/)
  - [SQLite](https://www.sqlite.org/index.html)
  - [TTY::Prompt](https://github.com/piotrmurach/tty-prompt)
  - [colorize](https://github.com/fazibear/colorize)
  
&nbsp;
 
# Installation
  ### Prerequisites
  Totally Accurate Military Simulator is built on Ruby & SQLite. Make sure you have the latest versions of all components installed before cloning this repo. You can find their official installation guides below:
  
  - [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
  - [SQLite](https://www.sqlite.org/download.html)
  
  ### Instructions
### Instructions
  - Clone the most recent branch in this repository
  > Make sure you are in the project path before running the commands
  - Run `bundle install` in your bash-enabled terminal to make sure all dependancies are installed
  - Run `rake db:create` to create a local PostgreSQL database
  - Run `rake db:migrate` to create the schema for said database
  - Run `rake db:seed` to seed the database
  - Run `ruby bin/run.rb` to start up program
  > Adjust the terminal screen size to have the best experience
 
&nbsp;

# License
<a href="https://github.com/jfeng530/Military-Simulator/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/jfeng530/nba_frontend?color=blue"></a>

Copyright 2019 © [Jacky Feng](https://github.com/jfeng530)
