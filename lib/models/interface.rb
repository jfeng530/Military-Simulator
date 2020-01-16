require_relative '../models/artmodule'

class Interface
    include ArtModule
    attr_accessor :user
    attr_reader :prompt

    def initialize
      @prompt = TTY::Prompt.new 
    end
  
    def menu_image
      return MENU
    end 

    def welcome
      system "clear"
      puts self.menu_image
      puts "\n"
      pid = fork{ exec 'afplay /Users/Jacky/Desktop/ssb8bit.mp3'}
      # pid = fork{ exec 'afplay ../models/ss8bit.mp3'}
      puts "\nWelcome to the Perfectly-Accurate Military Simulator"
      @prompt.select("-----------------------------------------------------") do |menu|
        menu.choice "New Game", -> { User.new_game }
        menu.choice "Continue Game", -> { User.continue_game }
        menu.choice "Quit", -> { pid = fork{ exec 'killall afplay' } }
      end 

    end
      
  end