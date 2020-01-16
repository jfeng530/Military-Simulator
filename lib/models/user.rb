require_relative '../models/artmodule'

class User < ActiveRecord::Base

    has_many :characters
    include ArtModule
    @@prompt = TTY::Prompt.new
 

    def self.new_game
        system "clear"
        if User.all.length >= 3
            puts "Sorry, cannot create any more saves!"
            User.continue_game
        else
            their_name = @@prompt.ask("Enter a username: ")
            while their_name == " " || their_name == nil
                puts "Please try again: "
                their_name = @@prompt.ask("Username: ")
            end
            loggedin = User.create(username: their_name)
            loggedin.create_character_menu
        end 
    end
  
    def self.continue_game
        system "clear"
        case User.all.length
        when 0
            @@prompt.select("There appears to be no saved games.") do |menu|
                menu.choice "New Game", -> { self.new_game }
            end
        when 1
            system "clear"
            @@prompt.select("Which game would you like to continue?") do |menu|
                menu.choice "#{User.first.username}", -> {User.first.logged_in_loading_screen}
            end
        when 2
            system "clear"
            @@prompt.select("Which game would you like to continue?") do |menu|
                menu.choice "#{User.first.username}", -> {User.first.logged_in_loading_screen}
                menu.choice "#{User.second.username}", -> {User.second.logged_in_loading_screen}
            end
        when 3
            system "clear"
            @@prompt.select("Which game would you like to continue?") do |menu|
                menu.choice "#{User.first.username}", -> {User.first.logged_in_loading_screen}
                menu.choice "#{User.second.username}", -> {User.second.logged_in_loading_screen}
                menu.choice "#{User.third.username}", -> {User.third.logged_in_loading_screen}
            end
        end
    end 
    
    def display_eagle
        return EAGLE
    end 

    def display_eli
        return ELI
    end 

    def logged_in_loading_screen
        puts self.display_eli
        puts "\nDon't forget to hydrate, soldier!"
        sleep 3
        @@prompt.select("Press ENTER to continue") do |menu|
            menu.choice "Continue", -> { self.main_menu }
        end 
    end 

    def create_character_menu
        system "clear"
        if Character.where(user: self).count >= 4
            @@prompt.select("Sorry but your army is full.") do |menu|
                menu.choice "Back", -> { self.logged_in_loading_screen }
            end
        else
            char_name = @@prompt.ask("Enter the name of your unit: ")
            while char_name == " " || char_name == nil
                puts "Please try again: "
                char_name = @@prompt.ask("Enter the name of your unit: ")
            end
    
            char_element = nil
            move1 = nil
            move2 = nil 
            move3 = nil
            move4 = nil
            @@prompt.select("Select the class of your unit: ") do |menu|
                menu.choice "#{Element.first.name}", -> { char_element = Element.first }
                menu.choice "#{Element.second.name}", -> { char_element = Element.second }
                menu.choice "#{Element.third.name}", -> { char_element = Element.third }
            end 

            case char_element.name
            when "Infantry"
                @@prompt.select("Select your first move for your unit: ") do |menu|
                    menu.choice "#{Move.man[0].name} , Damage: #{Move.man[0].damage}, #{Move.man[0].info}", -> { move1 = Move.man[0] }
                    menu.choice "#{Move.man[1].name} , Damage: #{Move.man[1].damage}, #{Move.man[1].info}", -> { move1 = Move.man[1] }
                    menu.choice "#{Move.man[2].name} , Damage: #{Move.man[2].damage}, #{Move.man[2].info}", -> { move1 = Move.man[2] }
                end

                @@prompt.select("Select your second move for your unit: ") do |menu|
                    menu.choice "#{Move.man[3].name} , Damage: #{Move.man[3].damage}, #{Move.man[3].info}", -> { move2 = Move.man[3] }
                    menu.choice "#{Move.man[4].name} , Damage: #{Move.man[4].damage}, #{Move.man[4].info}", -> { move2 = Move.man[4] }
                    menu.choice "#{Move.man[5].name} , Damage: #{Move.man[5].damage}, #{Move.man[5].info}", -> { move2 = Move.man[5] }
                end

                @@prompt.select("Select your third move for your unit: ") do |menu|
                    menu.choice "#{Move.man[6].name} , Damage: #{Move.man[6].damage}, #{Move.man[6].info}", -> { move3 = Move.man[6] }
                    menu.choice "#{Move.man[7].name} , Damage: #{Move.man[7].damage}, #{Move.man[7].info}", -> { move3 = Move.man[7] }
                    menu.choice "#{Move.man[8].name} , Damage: #{Move.man[8].damage}, #{Move.man[8].info}", -> { move3 = Move.man[8] }
                end

                @@prompt.select("Select your fourth move for your unit: ") do |menu|
                    menu.choice "#{Move.man[9].name} , Damage: #{Move.man[9].damage}, #{Move.man[9].info}", -> { move4 = Move.man[9] }
                    menu.choice "#{Move.man[10].name} , Damage: #{Move.man[10].damage}, #{Move.man[10].info}", -> { move4 = Move.man[10] }
                    menu.choice "#{Move.man[11].name} , Damage: #{Move.man[11].damage}, #{Move.man[11].info}", -> { move4 = Move.man[11] }
                end
            when "Air Forces"
                @@prompt.select("Select your first move for your unit: ") do |menu|
                    menu.choice "#{Move.air[0].name} , Damage: #{Move.air[0].damage}, #{Move.air[0].info}", -> { move1 = Move.air[0] }
                    menu.choice "#{Move.air[1].name} , Damage: #{Move.air[1].damage}, #{Move.air[1].info}", -> { move1 = Move.air[1] }
                    menu.choice "#{Move.air[2].name} , Damage: #{Move.air[2].damage}, #{Move.air[2].info}", -> { move1 = Move.air[2] }
                end

                @@prompt.select("Select your second move for your unit: ") do |menu|
                    menu.choice "#{Move.air[3].name} , Damage: #{Move.air[3].damage}, #{Move.air[3].info}", -> { move2 = Move.air[3] }
                    menu.choice "#{Move.air[4].name} , Damage: #{Move.air[4].damage}, #{Move.air[4].info}", -> { move2 = Move.air[4] }
                    menu.choice "#{Move.air[5].name} , Damage: #{Move.air[5].damage}, #{Move.air[5].info}", -> { move2 = Move.air[5] }
                end

                @@prompt.select("Select your third move for your unit: ") do |menu|
                    menu.choice "#{Move.air[6].name} , Damage: #{Move.air[6].damage}, #{Move.air[6].info}", -> { move3 = Move.air[6] }
                    menu.choice "#{Move.air[7].name} , Damage: #{Move.air[7].damage}, #{Move.air[7].info}", -> { move3 = Move.air[7] }
                    menu.choice "#{Move.air[8].name} , Damage: #{Move.air[8].damage}, #{Move.air[8].info}", -> { move3 = Move.air[8] }
                end

                @@prompt.select("Select your fourth move for your unit: ") do |menu|
                    menu.choice "#{Move.air[9].name} , Damage: #{Move.air[9].damage}, #{Move.air[9].info}", -> { move4 = Move.air[9] }
                    menu.choice "#{Move.air[10].name} , Damage: #{Move.air[10].damage}, #{Move.air[10].info}", -> { move4 = Move.air[10] }
                    menu.choice "#{Move.air[11].name} , Damage: #{Move.air[11].damage}, #{Move.air[11].info}", -> { move4 = Move.air[11] }
                end
            when "Air Defense Artillary"
                @@prompt.select("Select your first move for your unit: ") do |menu|
                    menu.choice "#{Move.missle[0].name} , Damage: #{Move.missle[0].damage}, #{Move.missle[0].info}", -> { move1 = Move.missle[0] }
                    menu.choice "#{Move.missle[1].name} , Damage: #{Move.missle[1].damage}, #{Move.missle[1].info}", -> { move1 = Move.missle[1] }
                    menu.choice "#{Move.missle[2].name} , Damage: #{Move.missle[2].damage}, #{Move.missle[2].info}", -> { move1 = Move.missle[2] }
                end

                @@prompt.select("Select your second move for your unit: ") do |menu|
                    menu.choice "#{Move.missle[3].name} , Damage: #{Move.missle[3].damage}, #{Move.missle[3].info}", -> { move2 = Move.missle[3] }
                    menu.choice "#{Move.missle[4].name} , Damage: #{Move.missle[4].damage}, #{Move.missle[4].info}", -> { move2 = Move.missle[4] }
                    menu.choice "#{Move.missle[5].name} , Damage: #{Move.missle[5].damage}, #{Move.missle[5].info}", -> { move2 = Move.missle[5] }
                end

                @@prompt.select("Select your third move for your unit: ") do |menu|
                    menu.choice "#{Move.missle[6].name} , Damage: #{Move.missle[6].damage}, #{Move.missle[6].info}", -> { move3 = Move.missle[6] }
                    menu.choice "#{Move.missle[7].name} , Damage: #{Move.missle[7].damage}, #{Move.missle[7].info}", -> { move3 = Move.missle[7] }
                    menu.choice "#{Move.missle[8].name} , Damage: #{Move.missle[8].damage}, #{Move.missle[8].info}", -> { move3 = Move.missle[8] }
                end

                @@prompt.select("Select your fourth move for your unit: ") do |menu|
                    menu.choice "#{Move.missle[9].name} , Damage: #{Move.missle[9].damage}, #{Move.missle[9].info}", -> { move4 = Move.missle[9] }
                    menu.choice "#{Move.missle[10].name} , Damage: #{Move.missle[10].damage}, #{Move.missle[10].info}", -> { move4 = Move.missle[10] }
                    menu.choice "#{Move.missle[11].name} , Damage: #{Move.missle[11].damage}, #{Move.missle[11].info}", -> { move4 = Move.missle[11] }
                end
            end 
            
            desc = @@prompt.ask("Enter a description for your unit: ")
            while desc == " " || desc == nil
                puts "Please enter a description for your unit: "
                desc = @@prompt.ask(" ")
            end

            new_char = Character.create(name: char_name, info: desc, user: self, element: char_element)
            CharacterMove.create(character: new_char, move: move1)
            CharacterMove.create(character: new_char, move: move2)
            CharacterMove.create(character: new_char, move: move3)
            CharacterMove.create(character: new_char, move: move4)
            system "clear"
            system "say Welcome new recruit!"
            puts "Here is your new unit: "
            puts "---------------------------"
            puts "Name: #{new_char.name}"
            puts "Class: #{new_char.element.name}"
            puts "#{new_char.info}"
            @@prompt.select("") do |menu|
                menu.choice "Continue", -> { self.logged_in_loading_screen }
            end
        end
    end 

    def main_loading_screen
        # system "clear"
        # pid = fork{ exec 'killall afplay' }
        # puts "Loading..."
        # sleep 2
        # puts "Cleaning barracks..."
        # pid = fork{ exec 'afplay /Users/Jacky/Desktop/ssb8bit.mp3'}
        # sleep 1
        # self.main_menu
        system "clear"
        pid = fork{ exec 'killall afplay' }
        puts self.display_eli
        puts "\nLoading..."
        puts "It's important to stay hydrated, soldier!"
        pid = fork{ exec 'afplay /Users/Jacky/Desktop/ssb8bit.mp3'}
        sleep 3
        @@prompt.select("Press ENTER to continue") do |menu|
            menu.choice "Continue", -> { self.main_menu }
        end 
    end 

    def return_from_battle_loading_screen
        system "clear"
        pid = fork{ exec 'killall afplay' }
        puts "Returning from battle..."
        sleep 2
        @@prompt.select("Press ENTER to continue") do |menu|
            menu.choice "Continue", -> { self.second_loading }
        end
    end 
    
    def second_loading
        system "clear"
        puts self.display_eli
        puts "It's important to stay hydrated, soldier!"
        pid = fork{ exec 'afplay /Users/Jacky/Desktop/ssb8bit.mp3'}
        sleep 2
        self.main_menu
    end

    def main_menu
        self.reload
        system "clear"
        puts self.display_eagle
        puts "\nWelcome back, General #{self.username}."
        puts "\nMain Menu"
        @@prompt.select("---------") do |menu|
            menu.choice "Enter the Battlefield", -> { self.select_character_menu }
            menu.choice "Recruit New Unit", -> { self.create_character_menu }
            menu.choice "View Units", -> { self.view_character_menu }
            menu.choice "Delete Save", -> { self.delete_save_menu }
            menu.choice "Log Out", -> { self.log_out }
        end
    end 

    def log_out
        system "clear"
        @@prompt.select ("Are you sure you want to log out of your session?") do |menu|
            menu.choice "Yes", -> { self.logging_out_screen }
            menu.choice "No", -> { self.logged_in_loading_screen }
        end 
    end 
    
    def logging_out_screen
        interface = Interface.new
        pid = fork{ exec 'killall afplay' }
        puts "Logging out..."
        sleep 2
        interface.welcome
    end 

    def view_character_menu
        self.reload
        system "clear"
        char_arr = Character.where(user: self)
        case char_arr.count
        when 1
            puts "1) Name: #{char_arr[0].name}"
            case char_arr[0].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[0].info}"
            puts "#{char_arr[0].element.sprite}"
            @@prompt.select("---------------------") do |menu|
                menu.choice "#{char_arr[0].name}", -> { char_arr[0].view_character_options }
                menu.choice "Back", -> { self.main_menu }
            end
        when 2 
            puts "1) Name: #{char_arr[0].name}"
            case char_arr[0].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[0].info}"
            puts "#{char_arr[0].element.sprite}"
            puts "---------------------"
            puts "2) Name: #{char_arr[1].name}"
            case char_arr[0].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[1].info}"
            puts "#{char_arr[1].element.sprite}"
            @@prompt.select("--------------------") do |menu|
                menu.choice "#{char_arr[0].name}", -> { char_arr[0].view_character_options }
                menu.choice "#{char_arr[1].name}", -> { char_arr[1].view_character_options }
                menu.choice "Back", -> { self.main_menu }
            end
        when 3 
            puts "1) Name: #{char_arr[0].name}"
            case char_arr[0].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[0].info}"
            puts "#{char_arr[0].element.sprite}"
            puts "---------------------"
            puts "2) Name: #{char_arr[1].name}"
            case char_arr[1].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[1].info}"
            puts "#{char_arr[1].element.sprite}"

            puts "---------------------"
            puts "3) Name: #{char_arr[2].name}"
            case char_arr[2].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[2].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[2].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[2].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[2].info}"
            puts "#{char_arr[2].element.sprite}"
            @@prompt.select("--------------------") do |menu|
                menu.choice "#{char_arr[0].name}", -> { char_arr[0].view_character_options }
                menu.choice "#{char_arr[1].name}", -> { char_arr[1].view_character_options }
                menu.choice "#{char_arr[2].name}", -> { char_arr[2].view_character_options }
                menu.choice "Back", -> { self.main_menu }
            end
        when 4
            puts "1) Name: #{char_arr[0].name}"
            case char_arr[0].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[0].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[0].info}"
            puts "#{char_arr[0].element.sprite}"
            puts "---------------------"
            puts "2) Name: #{char_arr[1].name}"
            case char_arr[1].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[1].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[1].info}"
            puts "#{char_arr[1].element.sprite}"
            puts "---------------------"
            puts "3) Name: #{char_arr[2].name}"
            case char_arr[2].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[2].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[2].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[2].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[2].info}"
            puts "#{char_arr[2].element.sprite}"
            puts "---------------------"
            puts "4) Name: #{char_arr[3].name}"
            case char_arr[3].element.name
            when "Air Defense Artillary"
                puts "   Class: " + "#{char_arr[3].element.name}".colorize(:color => :white, :background => :red) 
            when "Infantry"
                puts "   Class: " + "#{char_arr[3].element.name}".colorize(:color => :white, :background => :green)
            when "Air Forces"
                puts "   Class: " + "#{char_arr[3].element.name}".colorize(:color => :white, :background => :blue)
            end
            puts "   #{char_arr[3].info}"
            puts "#{char_arr[3].element.sprite}"
            @@prompt.select("--------------------") do |menu|
                menu.choice "#{char_arr[0].name}", -> { char_arr[0].view_character_options }
                menu.choice "#{char_arr[1].name}", -> { char_arr[1].view_character_options }
                menu.choice "#{char_arr[2].name}", -> { char_arr[2].view_character_options }
                menu.choice "#{char_arr[3].name}", -> { char_arr[3].view_character_options }
                menu.choice "Back", -> { self.main_menu }
            end
        when 0
            puts "There appears to be no units!"
            sleep 1
            self.main_menu
        end
        
    end 

    def quit_menu
        self.reload
        system "clear"
        @@prompt.select("Are you sure you want to quit?") do |menu|
            menu.choice "Yes", -> { return 0 }
            menu.choice "No", -> { self.main_menu }
        end 
    end 

    def delete_save_menu
        self.reload
        system "clear"
        puts "Are you sure you want to delete your save?"
        @@prompt.select("It cannot be undone.") do |menu|
            menu.choice "Yes", -> { self.actually_delete }
            menu.choice "No", -> { self.main_menu }
        end 
    end 

    def actually_delete
        self.reload
        system "clear"
        interface = Interface.new
        puts "Deleting..."
        sleep 1
        Character.where(user: self).destroy_all
        self.delete
        pid = fork{ exec 'killall afplay' }
        system "say Dismissed!"
        @@prompt.select("Save Deleted") do |menu|
            menu.choice "Back", -> { interface.welcome }
        end 
    end 

    def select_character_menu
        system "clear"
        all_units = self.characters.map do |unit|
            { unit.name => unit.id }
        end 
        enemy_units = Character.all.where(user: nil).map do |enemy|
            { enemy.name => enemy.id }
        end
        unitid = @@prompt.select("Select unit to send to battle", all_units)
        enemyid = @@prompt.select("Select an enemy to face", enemy_units)

        fighting_unit = Character.find(unitid)
        fighting_enemy = Character.find(enemyid)
        unithp = fighting_unit.element.hp 
        enemyhp = fighting_enemy.element.hp
        
        new_battle = Battle.create(unit_id:  unitid, enemy_id: enemyid, unit_hp: unithp, enemy_hp: enemyhp)
        sleep 1
        puts "Now Loading..."
        sleep 1
        new_battle.battle_loading_screen
    end 
end 