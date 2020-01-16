require_relative '../models/artmodule'

class Battle < ActiveRecord::Base
    include ArtModule
    @@prompt = TTY::Prompt.new
    belongs_to :unit, class_name: 'Character', foreign_key: "unit_id"
    belongs_to :enemy, class_name: 'Character', foreign_key: "enemy_id"

    def battle_loading_screen
        
        # system "clear"
        # pid = fork{ exec 'killall afplay' }
        # puts "Gearing up for battle..."
        # sleep 2
        # pid = fork{ exec 'afplay /Users/Jacky/Desktop/fightvol.mp3'}
        # self.user_battle_menu

        system "clear"
        pid = fork{ exec 'killall afplay' }
        puts self.display_eli
        puts "Gearing up for battle..."
        sleep 1
        puts "While you are waiting, why don't hydrate yourself, soldier?"
        sleep 3
        pid = fork{ exec 'afplay /Users/Jacky/Desktop/fightvol.mp3'}
        @@prompt.select("Press ENTER to continue") do |menu|
            menu.choice "Continue", -> { self.user_battle_menu }
        end
    end 

    def display_eli
        return ELI
    end 

    def display_attack
        return ATTACK
    end 

    def display_heal
        return HEAL
    end 

    def display_charge
        return CHARGE
    end 

    def display_protect
        return PROTECT
    end 

    def display_hurt
        return HURT
    end 

    def display_image
        case self.enemy.name
        when "Tom Cruise from Top Gun"
            return TOPGUN
        when "John Rambo"
            return RAMBO 
        when "Wall-E"
            return WALLE
        when "A Dragon"
            return DRAGON 
        when "John Cena"
            return CENA
        when "Red Barron"
            return BARRON
        when "Mel Gibson from Braveheart"
            return BRAVEHEART 
        when "Brad Pitt from Fury"
            return FURY 
        end 
    end
    
    def display_screen
        system "clear"
        self.reload
        unit_health = self.unit_hp
        enemy_health = self.enemy_hp
        case self.enemy.element.name
        when "Air Forces" 
            puts "#{self.enemy.name}".colorize(:color => :blue)
            puts "Class: " + "#{self.enemy.element.name}".colorize(:color => :blue)
            puts "HP: #{self.enemy_hp}"
            enemy_health.times {print " ".colorize(:color => :white, :background => :red)}
            puts "\n"
            case self.enemy_status
            when "Hurt"
                puts "Status: " + "HURT".colorize(:color => :red)
            when "Amplify"
                puts "Status: " + "AMPED UP".colorize(:color => :yellow)
            when "Protect"
                puts "Status: " + "PROTECTED".colorize(:color => :blue)
            when nil
                puts "Status: READY TO GO".colorize(:color => :blue)
            end 
            puts self.display_image
            puts "\n"
        when "Infantry"
            puts "#{self.enemy.name}".colorize(:color => :green)
            puts "Class: " + "#{self.enemy.element.name}".colorize(:color => :green)
            puts "HP: #{self.enemy_hp}"
            enemy_health.times {print " ".colorize(:color => :white, :background => :red)}
            puts "\n"
            case self.enemy_status
            when "Hurt"
                puts "Status: " + "HURT".colorize(:color => :red)
            when "Amplify"
                puts "Status: " + "AMPED UP".colorize(:color => :yellow)
            when "Protect"
                puts "Status: " + "PROTECTED".colorize(:color => :blue)
            when nil
                puts "Status: READY TO GO".colorize(:color => :green)
            end 
            puts self.display_image
            puts "\n"
        when "Air Defense Artillary"
            puts "#{self.enemy.name}".colorize(:color => :red)
            puts "Class: " + "#{self.enemy.element.name}".colorize(:color => :red)
            puts "HP: #{self.enemy_hp}"
            enemy_health.times {print " ".colorize(:color => :white, :background => :red)}
            puts "\n"
            case self.enemy_status
            when "Hurt"
                puts "Status: " + "HURT".colorize(:color => :red)
            when "Amplify"
                puts "Status: " + "AMPED UP".colorize(:color => :yellow)
            when "Protect"
                puts "Status: " + "PROTECTED".colorize(:color => :blue)
            when nil
                puts "Status: READY TO GO".colorize(:color => :red)
            end 
            puts self.display_image
            puts "\n"
        end 
        case self.unit.element.name
        when "Air Forces" 
            puts "#{self.unit.name}".colorize(:color => :blue)
            puts "Class: " + "#{self.unit.element.name}".colorize(:color => :blue)
            puts "HP: #{self.unit_hp}"
            unit_health.times {print " ".colorize(:color => :white, :background => :red)}
            puts "\n"
            case self.unit_status
            when "Hurt"
                puts "Status: " + "HURT".colorize(:color => :red)
            when "Amplify"
                puts "Status: " + "AMPED UP".colorize(:color => :yellow)
            when "Protect"
                puts "Status: " + "PROTECTED".colorize(:color => :light_blue)
            when nil
                puts "Status: READY TO GO".colorize(:color => :blue)
            end 
        when "Infantry"
            puts "#{self.unit.name}".colorize(:color => :green)
            puts "Class: " + "#{self.unit.element.name}".colorize(:color => :green)
            puts "HP: #{self.unit_hp}"
            unit_health.times {print " ".colorize(:color => :white, :background => :red)}
            puts "\n"
            case self.unit_status
            when "Hurt"
                puts "Status: " + "HURT".colorize(:color => :red)
            when "Amplify"
                puts "Status: " + "AMPED UP".colorize(:color => :yellow)
            when "Protect"
                puts "Status: " + "PROTECTED".colorize(:color => :blue)
            when nil
                puts "Status: READY TO GO".colorize(:color => :green)
            end 
        when "Air Defense Artillary"
            puts "#{self.unit.name}".colorize(:color => :red)
            puts "Class: " + "#{self.unit.element.name}".colorize(:color => :red)
            puts "HP: #{self.unit_hp}"
            unit_health.times {print " ".colorize(:color => :white, :background => :red)}
            puts "\n"
            case self.unit_status
            when "Hurt"
                puts "Status: " + "HURT".colorize(:color => :red)
            when "Amplify"
                puts "Status: " + "AMPED UP".colorize(:color => :yellow)
            when "Protect"
                puts "Status: " + "PROTECTED".colorize(:color => :blue)
            when nil
                puts "Status: READY TO GO".colorize(:color => :red)
            end 
        end
    end

    def user_battle_menu
        self.display_screen
        if self.unit_status == "Hurt"
            puts "#{self.unit.name} suffering from wounds"
            system "say Ow"
            sleep 2
            self.update(unit_hp: self.unit_hp -= self.unit_status_value)
            if self.unit_hp <= 0
                self.lose_screen
            end  
        end
        self.display_screen
        
        all_moves = self.unit.moves.map do |move|
            { move.name => move }
        end
        selected_move = @@prompt.select("Issue a command:", all_moves)
        self.unit_apply_move(selected_move)

    end 

    def unit_apply_move(move)
        case move.effect
        when "Damage"
            self.unit_damage_move(move)
        when "Heal"
            self.unit_heal_move(move)
        when "Amplify"
            self.unit_amplify_move(move)
        when "Protect"
            self.unit_protect_move(move)
        when "Hurt"
            self.unit_hurt_move(move)
        end
    end 

    def unit_damage_move(move)
        puts "Sending command..."
        sleep 1
        puts "Receiving command..."
        sleep 1
        puts "Command received"
        sleep 2
        puts "#{self.unit.name} uses #{move.name}!"
        system "say #{self.unit.name} uses #{move.name}!"
        sleep 2
        puts "#{self.unit.name} #{move.info} at #{self.enemy.name}"
        system "say #{self.unit.name} #{move.info} at #{self.enemy.name}"
        altered_damage = 0
        added_damage = 0
        if unit_status == "Amplify"
            added_damage += self.unit_status_value
            self.update(unit_status_value: 0)
            self.update(unit_status: nil)
        end
        case move.element.name 
        when "Air Forces"
            case self.enemy.element.name
            when "Air Forces"
                altered_damage = move.damage
            when "Infantry"
                altered_damage = move.damage * 2
            when "Air Defense Artillary"
                altered_damage = move.damage / 2
            end 
        when "Infantry"
            case self.enemy.element.name
            when "Air Forces"
                altered_damage = move.damage / 2
            when "Infantry"
                altered_damage = move.damage
            when "Air Defense Artillary"
                altered_damage = move.damage * 2
            end
        when "Air Defense Artillary"
            case self.enemy.element.name
            when "Air Forces"
                altered_damage = move.damage * 2
            when "Infantry"
                altered_damage = move.damage / 2
            when "Air Defense Artillary"
                altered_damage = move.damage
            end
        end
        altered_damage += added_damage
        if self.enemy_status == "Protect"
            puts "Enemy evaded our attack!"
            sleep 1
            system "say Enemy evaded our attack!"
            self.update(enemy_status: nil)
        else
            self.update(enemy_hp: self.enemy_hp -= altered_damage)
            sleep 1
            system "clear"
            puts self.display_attack
            puts "\nTarget hit!"
            system "say Target hit!"
        end
        if self.enemy_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.victory_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.enemy_turn }
            end 
        end
    end 

    def unit_heal_move(move)
        puts "Sending command..."
        sleep 1
        puts "Receiving command..."
        sleep 1
        puts "Command received"
        sleep 2
        puts "#{self.unit.name} uses #{move.name}!"
        system "say #{self.unit.name} uses #{move.name}!"
        sleep 2
        system "clear"
        puts self.display_heal
        puts "\n#{self.unit.name} #{move.info}"
        system "say #{self.unit.name} #{move.info}"
        self.update(unit_hp: self.unit_hp += move.damage)
        self.update(unit_status: nil)
        self.update(unit_status_value: 0)
        if self.enemy_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.victory_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.enemy_turn }
            end 
        end
    end 

    def unit_amplify_move(move)
        puts "Sending command..."
        sleep 1
        puts "Receiving command..."
        sleep 1
        puts "Command received"
        sleep 2
        puts "#{self.unit.name} uses #{move.name}!"
        system "say #{self.unit.name} uses #{move.name}!"
        sleep 2
        system "clear"
        puts self.display_charge
        puts "\n#{self.unit.name} #{move.info}"
        system "say #{self.unit.name} #{move.info}"

        self.update(unit_status_value: move.damage)
        self.update(unit_status: "Amplify")
        
        if self.enemy_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.victory_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.enemy_turn }
            end 
        end
    end 

    def unit_protect_move(move)
        puts "Sending command..."
        sleep 1
        puts "Receiving command..."
        sleep 1
        puts "Command received"
        sleep 2
        puts "#{self.unit.name} uses #{move.name}!"
        system "say #{self.unit.name} uses #{move.name}!"
        sleep 2
        system "clear"
        puts self.display_protect
        puts "\n#{self.unit.name} #{move.info}"
        system "say #{self.unit.name} #{move.info}"

        self.update(unit_status: "Protect")

        if self.enemy_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.victory_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.enemy_turn }
            end 
        end
    end 

    def unit_hurt_move(move)
        puts "Sending command..."
        sleep 1
        puts "Receiving command..."
        sleep 1
        puts "Command received"
        sleep 2
        puts "#{self.unit.name} uses #{move.name}!"
        system "say #{self.unit.name} uses #{move.name}!"
        sleep 2
        system "clear"
        puts self.display_hurt
        puts "\n#{self.unit.name} #{move.info} at #{self.enemy.name}"
        system "say #{self.unit.name} #{move.info} at #{self.enemy.name}"

        self.update(enemy_status: "Hurt")
        self.update(enemy_status_value: move.damage)
        self.update(enemy_hp: self.enemy_hp -= 1)
        if self.enemy_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.victory_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.enemy_turn }
            end 
        end
    end

    def enemy_turn
        system "clear"
        self.display_screen
        
        if self.enemy_status == "Hurt"
            puts "#{self.enemy.name} suffering from wounds."
            system "say Ow"
            sleep 2
            self.update(enemy_hp: self.enemy_hp -= self.enemy_status_value)
            if self.enemy_hp <= 0
                self.victory_screen
            end  
        end
        system "clear"
        
        self.display_screen
        max = self.enemy.moves.count - 1
        move_num = rand(0..max)
        enemy_move = self.enemy.moves[move_num]
        self.enemy_use_move(enemy_move)
    end 

    def enemy_use_move(move)
        case move.effect
        when "Damage"
            self.enemy_damage_move(move)
        when "Heal"
            self.enemy_heal_move(move)
        when "Amplify"
            self.enemy_amplify_move(move)
        when "Protect"
            self.enemy_protect_move(move)
        when "Hurt"
            self.enemy_hurt_move(move)
        end
    end 

    def enemy_damage_move(move)
        puts "Incoming attack!"
        sleep 1
        puts "Brace yourself!"
        sleep 1
        puts "#{self.enemy.name} uses #{move.name}!"
        sleep 1
        system "Say #{self.enemy.name} uses #{move.name}!"
        puts "#{self.enemy.name} #{move.info} at #{self.unit.name}"
        system "Say #{self.enemy.name} #{move.info} at #{self.unit.name}"
        altered_damage = 0
        added_damage = 0
        if enemy_status == "Amplify"
            added_damage += self.enemy_status_value
            self.update(enemy_status_value: 0)
            self.update(enemy_status: nil)
        end
        case move.element.name 
        when "Air Forces"
            case self.unit.element.name
            when "Air Forces"
                altered_damage = move.damage
            when "Infantry"
                altered_damage = move.damage * 2
            when "Air Defense Artillary"
                altered_damage = move.damage / 2
            end 
        when "Infantry"
            case self.unit.element.name
            when "Air Forces"
                altered_damage = move.damage / 2
            when "Infantry"
                altered_damage = move.damage
            when "Air Defense Artillary"
                altered_damage = move.damage * 2
            end
        when "Air Defense Artillary"
            case self.unit.element.name
            when "Air Forces"
                altered_damage = move.damage * 2
            when "Infantry"
                altered_damage = move.damage / 2
            when "Air Defense Artillary"
                altered_damage = move.damage
            end
        end
        altered_damage += added_damage
        if self.unit_status == "Protect"
            puts "Our unit evaded the attack!"
            sleep 1
            system "say Our unit evaded the attack!"
            self.update(unit_status: nil)
        else
            sleep 1
            self.update(unit_hp: self.unit_hp -= altered_damage)
            system "clear"
            puts self.display_attack
            puts "\nTarget hit"
            system "say Target hit."
        end
        
        if self.unit_hp <= 0
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.lose_screen }
            end
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.user_battle_menu }
            end 
        end
    end 

    def enemy_heal_move(move)
        puts "Incoming attack!"
        sleep 1
        puts "Brace yourself!"
        sleep 1
        puts "#{self.enemy.name} uses #{move.name}!"
        system "Say #{self.enemy.name} uses #{move.name}!"
        sleep 1
        system "clear"
        puts self.display_heal
        puts "\n#{self.enemy.name} #{move.info}"
        system "Say #{self.enemy.name} #{move.info}"
        self.update(enemy_hp: self.enemy_hp += move.damage)
        self.update(enemy_status: nil)
        self.update(enemy_status_value: 0)
        if self.unit_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.lose_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.user_battle_menu }
            end 
        end
    end

    def enemy_amplify_move(move)
        puts "Incoming attack!"
        sleep 1
        puts "Brace yourself!"
        sleep 1
        puts "#{self.enemy.name} uses #{move.name}!"
        system "Say #{self.enemy.name} uses #{move.name}!"
        sleep 1
        system "clear"
        puts self.display_charge
        puts "\n#{self.enemy.name} #{move.info}"
        system "Say #{self.enemy.name} #{move.info}"

        self.update(enemy_status_value: move.damage)
        self.update(enemy_status: "Amplify")
        
        if self.unit_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.lose_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.user_battle_menu }
            end 
        end
    end

    def enemy_protect_move(move)
        puts "Incoming attack!"
        sleep 1
        puts "Brace yourself!"
        sleep 1
        puts "#{self.enemy.name} uses #{move.name}!"
        system "Say #{self.enemy.name} uses #{move.name}!"
        sleep 1
        system "clear"
        puts self.display_protect
        puts "\n#{self.enemy.name} #{move.info}"
        system "Say #{self.enemy.name} #{move.info}"

        self.update(enemy_status: "Protect")

        if self.unit_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.lose_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.user_battle_menu }
            end 
        end
    end 

    def enemy_hurt_move(move)
        puts "Incoming attack!"
        sleep 1
        puts "Brace yourself!"
        sleep 1
        puts "#{self.enemy.name} uses #{move.name}!"
        system "Say #{self.enemy.name} uses #{move.name}!"
        sleep 1
        system "clear"
        puts self.display_hurt
        puts "\n#{self.enemy.name} #{move.info} at #{self.unit.name}"
        system "Say #{self.enemy.name} #{move.info} at #{self.unit.name}"

        self.update(unit_status: "Hurt")
        self.update(unit_status_value: move.damage)
        self.update(unit_hp: self.unit_hp -= 1)
        if self.unit_hp <= 0
            @@prompt.select ("") do |menu|
                menu.choice "Continue", -> { self.lose_screen }
            end 
        else 
            @@prompt.select ("--------------------") do |menu|
                menu.choice "Continue", -> { self.user_battle_menu }
            end 
        end
    end

    def victory_image
        return WINNER
    end

    def loser_image
        return LOSER
    end 

    def victory_screen
        system "clear"
        pid = fork{ exec 'killall afplay' }
        unit_health = self.unit_hp
        enemy_health = self.enemy_hp
        self.update(winner: self.unit.name)
        self.update(loser: self.enemy.name)
        pid = fork{ exec 'afplay /Users/Jacky/Desktop/win.mp3'}
        puts self.victory_image
        puts "\n"
        puts "WINNER"
        puts "Mission accomplished, soldier"
        puts "Winner: #{self.unit.name}"
        puts "HP: "
        unit_health.times {print " ".colorize(:color => :white, :background => :red)}
        puts "\n"
        puts "Loser: #{self.enemy.name}"
        puts "HP: 0"
        enemy_health.times {print " ".colorize(:color => :white, :background => :red)}
        system "say Mission accomplished, soldier."
        @@prompt.select ("") do |menu|
            menu.choice "Continue", -> { self.unit.user.return_from_battle_loading_screen }
        end
    end

    def lose_screen
        system "clear"
        pid = fork{ exec 'killall afplay' }
        unit_health = self.unit_hp
        enemy_health = self.enemy_hp
        self.update(winner: self.enemy.name)
        self.update(loser: self.unit.name)
        pid = fork{ exec 'afplay /Users/Jacky/Desktop/losemario.mp3'}
        puts self.loser_image
        puts "\n"
        puts "LOSER"
        puts "We will get them next time"
        puts "Winner: #{self.enemy.name}"
        puts "HP: "
        enemy_health.times {print " ".colorize(:color => :white, :background => :red)}
        puts "\n"
        puts "Loser: #{self.unit.name}"
        puts "HP: 0"
        system "say We will get them next time"
        @@prompt.select ("") do |menu|
            menu.choice "Continue", -> { self.unit.user.return_from_battle_loading_screen }
        end
    end 
end     