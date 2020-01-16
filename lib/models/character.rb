class Character < ActiveRecord::Base

    belongs_to :user
    belongs_to :element
    has_many :character_moves
    has_many :moves, through: :character_moves

    has_many :battles

    has_many :battles_as_unit, class_name: "Battle", foreign_key: "unit_id"
    has_many :enemies, through: :battles_as_unit, source: :enemy

    has_many :battles_as_enemy, class_name: "Battle", foreign_key: "enemy_id"
    has_many :units, through: :battles_as_enemy, source: :unit

    has_many :winners, class_name: "Battle", foreign_key: "winner"
    has_many :losers, class_name: "Battle", foreign_key: "loser"

    @@prompt = TTY::Prompt.new


    def view_character_options 
        self.reload
        system "clear"
        @@prompt.select ("--------------------") do |menu|
            menu.choice "View Moves", -> { self.view_moves_menu }
            menu.choice "View Service Record", -> { self.view_battles_menu }
            menu.choice "Edit Unit", -> { self.edit_char_menu }
            menu.choice "Delete Unit", -> { self.delete_char_menu }
            menu.choice "Back", -> { self.user.view_character_menu }
        end 
    end

    def view_battles_menu
        wins = self.battles_as_unit.where(winner: self.name).count
        losses = self.battles_as_unit.where(loser: self.name).count 
        puts "#{self.name}'s Service Record"
        puts "Wins: #{wins}"
        puts "Losses: #{losses}"
        puts "-----------------------------"
        self.battles_as_unit.each do |battle|
             puts "Winner: #{battle.winner}"
             puts "Loser: #{battle.loser}"
             puts "----------------------"
        end 
        @@prompt.select ("") do |menu|
            menu.choice "Back", -> { self.view_character_options }
        end     
    end 

    def view_moves_menu
        system "clear"
        move_arr = Move.all.select { |move| move.characters.include?(self) }
        move_arr.each do |move|
            puts "Name: #{move.name}"
            puts "Damage: #{move.damage}"
            puts "#{move.info}"
            puts "------------"
        end
        @@prompt.select " " do |menu|
            menu.choice "Back", -> { self.view_character_options }
        end 

    end 

    def delete_char_menu
        system "clear"
        char_arr = Character.where(user: self.user)
        if char_arr == 1
            puts "Sorry, you only have one unit in your army left!"
            self.user.view_character_menu
        else
            @@prompt.select "Are you sure you want to delete this unit?" do |menu|
                menu.choice "Yes", -> { self.remove_char }
                menu.choice "No", -> { self.view_character_options }
            end
        end  
    end 

    def remove_char
        system "clear"
        username = self.user
        puts "#{self.name} discharged."
        system "say You have been dismissed, soldier."
        sleep 2
        self.delete
        username.view_character_menu
    end 

    def edit_char_menu
        @@prompt.select "What would you like to edit?" do |menu|
            menu.choice "Name", -> { self.change_name }
            menu.choice "Description", -> { self.change_info }
            menu.choice "Back", -> { self.view_character_options }
        end 
    end

    def change_name
        puts "Enter a new name:"
        new_name = gets.chomp
        self.update(name: new_name)
        @@prompt.select "Name has been changed to #{new_name}." do |menu|
            menu.choice "Continue", -> { self.user.view_character_menu }
        end 
    end 

    def change_info
        puts "Enter a new description:"
        new_info = gets.chomp
        self.update(info: new_info)
        puts "Description has been changed to: "
        @@prompt.select "#{new_info}" do |menu|
            menu.choice "Continue", -> { self.user.view_character_menu }
        end 
    end

end 