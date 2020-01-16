class Move < ActiveRecord::Base
    @@prompt = TTY::Prompt.new

    has_many :character_moves
    has_many :characters, through: :character_moves
    belongs_to :element

    def self.air 
        Move.all.select {|move| move.element.name == "Air Forces"}
    end 

    def self.man 
        Move.all.select {|move| move.element.name == "Infantry"}
    end 

    def self.missle
        Move.all.select {|move| move.element.name == "Air Defense Artillary"}
    end 
end 